{ ... }: {
  programs.newsboat = {
    enable = true;
    urls = [
      {
        url = "https://www.reddit.com/r/nixos.rss";
        title = "Reddit NixOS";
      }
      {
        url = "https://www.reddit.com/r/rust.rss";
        title = "Reddit Rust";
        tags = [ "rust" ];
      }
      {
        url = "https://nixos.org/blog/announcements-rss.xml";
        title = "NixOS News";
      }
      {
        url = "https://www.tweag.io/rss.xml";
        title = "Tweag Blog";
      }
      {
        url = "https://github.blog/feed/";
        title = "GitHub Blog";
      }
      {
        url = "https://haskellweekly.news/podcast.rss";
        title = "Haskell Weekly";
      }
      {
        url = "https://dotfiles.substack.com/feed";
        title = "Dotfiles";
      }
      {
        url = "https://stackoverflow.blog/feed";
        title = "Stackoverflow Blog";
      }
      {
        url = "https://forum.zettelkasten.de/discussions/feed.rss";
        title = "Zettelkasten Forum";
      }
      {
        url = "https://zettelkasten.de/feed.atom";
        title = "Zettelkasten Blog";
      }
      {
        url = "https://serokell.io/blog.rss.xml";
        title = "Serokell Blog";
      }
      {
        url = "https://martinfowler.com/bliki/bliki.atom";
        title = "Martin Fowler Blog";
      }
      {
        url = "https://media.ccc.de/updates.rdf";
        title = "Media CCC";
      }
      {
        url = "https://fragdenstaat.de/blog/feed/";
        title = "Frag den Staat Blog";
      }
      {
        url = "https://www.alternativlos.org/ogg.rss";
        title = "Alternativlos";
      }
      {
        url = "https://chaosradio.de/feed/m4a";
        title = "Chaosradio";
      }
      {
        url = "https://buttondown.email/hillelwayne/rss";
        title = "Hillel Wayne";
      }
      {
        url = "https://this-week-in-rust.org/rss.xml";
        title = "This Week in Rust";
      }
      {
        url = "https://blog.rust-lang.org/feed.xml";
        title = "Rust Main Blog";
        tags = [ "rust" ];
      }
      {
        url = "https://blog.rust-lang.org/inside-rust/feed.xml";
        title = "Inside Rust Blog";
        tags = [ "rust" ];
      }
      {
        url = "https://feeds.feedburner.com/ThePragmaticEngineer";
        title = "The Pragmatic Engineer";
      }
      {
        url = "https://developerlife.com/feed.xml";
        title = "Building with Naz";
        tags = [ "rust" ];
      }
      {
        url = "https://rustacean-station.org/podcast.rss";
        title = "Rustacean Station";
        tags = [ "rust" ];
      }
      {
        url = "https://jamesmunns.com/podcast-feed-m4a.xml";
        title = "Chats with James";
      }
      {
        url = "https://logbuch-netzpolitik.de/feed/m4a";
        title = "Logbuch Netzpolitik";
      }
      {
        url = "https://bit-rauschen.podigee.io/feed/mp3";
        title = "Bit-Rauschen";
      }
      {
        url = "https://holub.com/feed/";
        title = "Allen Holub";
      }
      {
        url = "https://newrustacean.com/feed.xml";
        title = "New Rustacean";
        tags = [ "rust" ];
      }
      {
        url =
          "https://raw.githubusercontent.com/request-for-explanation/podcast/gh-pages/rss.xml";
        title = "Request for Explanation";
        tags = [ "rust" ];
      }
      {
        url = "https://letscast.fm/podcasts/rust-in-production-82281512/feed";
        title = "Rust in Production";
        tags = [ "rust" ];
      }
      {
        url = "https://software-architektur.tv/feed.xml";
        title = "Software Architektur TV";
      }
      {
        url = "https://softwareengineeringdaily.com/category/podcast/feed/";
        title = "Software Engineering Daily";
      }
      {
        url = "https://feeds.transistor.fm/programming-throwdown";
        title = "Programming Throwdown";
      }
      {
        url = "https://passwort.podigee.io/feed/mp3";
        title = "Passwort - Der Podcast von Heise Security";
      }
      {
        url = "https://wayofthecrab.com/rss.xml";
        title = "The Way of the Crab";
        tags = [ "rust" ];
      }
    ];

    extraConfig = ''
      color background default default
      color listnormal color255 default
      color listfocus color238 color255 standout
      color listnormal_unread color47 default
      color listfocus_unread color238 color47 standout
      color info color141 color236

      highlight all "---.*---" yellow
      highlight feedlist ".*(0/0))" black
      highlight article "(^Feed:|^Title:|^Date:|^Link:|^Author:)" cyan default bold
      highlight article "https?://[^ ]+" yellow default
      highlight article "\\[[0-9][0-9]*\\]" magenta default bold
      highlight article "\\[image\\ [0-9]+\\]" green default bold
      highlight article "\\[embedded flash: [0-9][0-9]*\\]" green default bold
      highlight article ":.*\\(link\\)$" cyan default
      highlight article ":.*\\(image\\)$" blue default
      highlight article ":.*\\(embedded flash\\)$" magenta default

      feedlist-format "%4i %n %11u %t %> %T "

      player mplayer
      download-path "~/podcasts/%n"
      download-filename-format "%F-%t.%e"
      max-downloads 3

      podcast-auto-enqueue yes
    '';
  };
}
