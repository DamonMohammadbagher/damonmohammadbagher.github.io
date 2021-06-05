import mx.controls.Tree;

class TreeNavMenu extends MovieClip {
  var menuXML:XML;
  var menuTree:Tree;
  function TreeNavMenu() {
    // Set up the appearance of the tree and event handlers
    menuTree.setStyle("fontFamily", "_sans");
    menuTree.setStyle("fontSize", 12);
    // Load the menu XML
    var treeNavMenu = this;
    menuXML = new XML();
    menuXML.ignoreWhite = true;
    menuXML.load("TreeNavMenu.xml");
    menuXML.onLoad = function() {
      treeNavMenu.onMenuLoaded();
    };
  }
  function change(event:Object) {
    if (menuTree == event.target) {
      var node = menuTree.selectedItem;
      // If this is a branch, expand/collapse it
      if (menuTree.getIsBranch(node)) {
        menuTree.setIsOpen(node, !menuTree.getIsOpen(node), true);
      }
      // If this is a hyperlink, jump to it
      var url = node.attributes.url;
      if (url) {
        getURL(url, "_parent");
      }
      // Clear any selection
      menuTree.selectedNode = null;
    }
  }
  function onMenuLoaded() {
    menuTree.dataProvider = menuXML.firstChild;
    menuTree.addEventListener("change", this);

  }
  
}

