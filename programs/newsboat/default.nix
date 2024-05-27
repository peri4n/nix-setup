{ pkgs, ... }:
{
  programs.newsboat = {
    enable = true;
    urls = [
      {
        url = "https://www.reddit.com/r/nixos.rss";
        title = "Reddit NixOS";
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
        url = "https://www.heise.de/rss/heise-atom.xml";
        title = "Heise Online";
      }
      {
        url = "https://www.heise.de/developer/rss/news-atom.xml";
        title = "Heise Developer";
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
        url = "https://blog.fefe.de/rss.xml";
        title = "Fefe Blog";
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
    '';
  };
}
