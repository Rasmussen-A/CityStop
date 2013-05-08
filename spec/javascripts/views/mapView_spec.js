describe("MapView", function() {
  describe("Initialize", function() {

    beforeEach(function() {
      loadFixtures("map.html");
    });

    it("should use #map element by default", sinon.test(function() {
      // Preparing, for map provider see asserts/js/lib/leafletMapProvider
      var mp = new App.MapProviders.Leaflet();
      var mapSpy = this.stub(mp, "setViewForMap");
      var setViewSpy = this.stub(mp, "setViewForMap")
      // Act
      var view = new App.MapView({
        mapProvider: mp;
      });
      // Assert
      expect(view.el.id).toEqual("map");
      mapSpy.restore();
      setViewSpy.restore();
    }));

    it("should create a map", sinon.test(function() {
      //Arrange
      var mp = new App.MapProviders.Leaflet();
      var mapProviderMock = this.mock(mp);
      mapProviderMock.expects("createMap").withArgs("map").once();
      mapProviderMock.expects("setViewForMap").once();
      //Act
      var view = new App.MapView({
        mapProvider: mp
      });
      //Assert
      mapProviderMock.verify();
    }));

  });
});
