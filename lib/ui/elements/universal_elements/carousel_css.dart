
String carouselCss = '''
@keyframes tonext {
  75% {
    left: 0;
  }
  95% {
    left: 100%;
  }
  98% {
    left: 100%;
  }
  99% {
    left: 0;
  }
}

@keyframes tostart {
  75% {
    left: 0;
  }
  95% {
    left: -300%;
  }
  98% {
    left: -300%;
  }
  99% {
    left: 0;
  }
}

@keyframes snap {
  96% {
    scroll-snap-align: center;
  }
  97% {
    scroll-snap-align: none;
  }
  99% {
    scroll-snap-align: none;
  }
  100% {
    scroll-snap-align: center;
  }
}

body {
  margin: 0;
  padding: 0;
  font-family: 'Roboto', sans-serif;
}

.carousel {
  position: relative;
  max-width: 100%;
  margin: 0 auto;
}

.carousel__viewport {
  display: flex;
  overflow-x: auto;
  scroll-snap-type: x mandatory;
}

.carousel__slide {
  scroll-snap-align: start;
}

.carousel__slide img {
  width: 100%;
  height: auto;
  display: block;
  background-color: transparent;
}

.carousel__snapper {
  scroll-snap-align: center;
}

@media (hover: hover) {
  .carousel__snapper {
    animation-name: tonext, snap;
    animation-timing-function: ease;
    animation-duration: 4s;
    animation-iteration-count: infinite;
  }

  .carousel__slide:last-child .carousel__snapper {
    animation-name: tostart, snap;
  }
}

@media (prefers-reduced-motion: reduce) {
  .carousel__snapper {
    animation-name: none;
  }
}

.carousel:hover .carousel__snapper,
.carousel:focus-within .carousel__snapper {
  animation-name: none;
}'''
;