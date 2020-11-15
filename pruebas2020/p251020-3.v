import sync
import json

const (
	stories_url   = 'https://hacker-news.firebaseio.com/v0/topstories.json'
	item_url_base = 'https://hacker-news.firebaseio.com/v0/item'
)

struct Story {
	title string
}

fn main() {
	resp := http.get(stories_url)?
	ids := json.decode([]int, resp.body)?
	mut cursor := 0
	for _ in 0 .. 8 {
		go fn () {
			for {
				lock  {
					if cursor >= ids.len {
						break
					}
					id := ids[cursor]
					cursor++
				}
				resp = http.get('$item_url_base/$id.json') ?
				story := json.decode(Story, resp.body)?
				println(story.title)
			}
		}()
	}
	runtime.wait()
}
