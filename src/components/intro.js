import ldlogo from "../ld-light.png";


export default function Intro (flag) {
  console.log(flag.release)
return (
    <div className="grid h-1/2 grid-cols-3 place-items-center">
      <div className="col-start-2">
              <img
                src={ldlogo}
                className="App mx-auto h-56 lg:h-60 2xl:h-80"
                alt="logo"
              />
            </div>
    </div>
)
}