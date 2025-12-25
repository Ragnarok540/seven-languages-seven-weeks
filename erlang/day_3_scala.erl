% • Take the sizer application and add a message to count the number
% of links on the page.
% • Bonus problem: Make the sizer follow the links on a given page,
% and load them as well. For example, a sizer for “google.com” would
% compute the size for Google and all of the pages it links to.

% import scala.io._
% import scala.actors._
% import Actor._

% // START:loader
% object PageLoader {
%  def getPageSize(url : String) = Source.fromURL(url).mkString.length
% }
% // END:loader

% val urls = List("http://www.amazon.com/", 
%                "http://www.twitter.com/",
%                "http://www.google.com/",
%                "http://www.cnn.com/" )

% // START:time
% def timeMethod(method: () => Unit) = {
%  val start = System.nanoTime
%  method()
%  val end = System.nanoTime
%  println("Method took " + (end - start)/1000000000.0 + " seconds.")
% }
% // END:time

% // START:sequential
% def getPageSizeSequentially() = {
%  for(url <- urls) {
%    println("Size for " + url + ": " + PageLoader.getPageSize(url))
%  }
% }
% // END:sequential

% // START:concurrent
% def getPageSizeConcurrently() = {
%  val caller = self

%  for(url <- urls) {
%    actor { caller ! (url, PageLoader.getPageSize(url)) }
%  }

%  for(i <- 1 to urls.size) {
%    receive {
%      case (url, size) =>
%        println("Size for " + url + ": " + size)            
%    }
%  }
% }
% // END:concurrent

% // START:script
% println("Sequential run:")
% timeMethod { getPageSizeSequentially }

% println("Concurrent run")
% timeMethod { getPageSizeConcurrently }
% // END:script
