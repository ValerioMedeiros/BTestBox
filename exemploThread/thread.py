...
import logging
from urllib.request import urlopen
from threading import Thread
from json import JSONDecoder
from queue import Queue
...
logging.getLogger().addHandler(logging.StreamHandler())


urls = ["diego", "http://www.google.com", "http://www.uol.com"]
# Define a crawl function that retrieves data from a url and places the result in results[index]
# The 'results' list will hold our retrieved data
# The 'urls' list contains all of the urls that are to be checked for data

# Threaded function for queue processing.
def crawl(q, result):
    while not q.empty():
        work = q.get()  # fetch new work from the Queue
        try:
            data = urlopen(work[1]).read()
            logging.warning("Requested..." + work[1])
            result[work[0]] = data  # Store data back at correct index
        except:
            logging.error('Error with URL check!')
            result[work[0]] = {}
        # signal to the queue that task has been processed
        q.task_done()
    return True

#set up the queue to hold all the urls
q = Queue(maxsize=0)
# Use many threads (50 max, or one for each url)
num_theads = min(50, len(urls))

# Populating Queue with tasks
results = [{} for x in urls];
# load up the queue with the urls to fetch and the index for each job (as a tuple):
for i in range(len(urls)):
    # need the index and the url in each queue item.
    q.put((i, urls[i]))

#Starting worker threads on queue processing
for i in range(num_theads):
    logging.debug('Starting thread ', i)
    worker = Thread(target=crawl, args=(q,results))
    worker.setDaemon(True)    #setting threads as "daemon" allows main program to
                              #exit eventually even if these dont finish
                              #correctly.
    worker.start()
#now we wait until the queue has been processed
q.join()
logging.warning('All tasks completed.')