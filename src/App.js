import QRCode from "./components/qrCode";
import ldlogo from "./ld-light.png";
import toggle from "./toggle_thumbsup.png";
import "./App.css";
import { useFlags } from "launchdarkly-react-client-sdk";
import Header from "./components/header";
import Login from "./components/login";
import Intro from "./components/intro";
import Release from "./components/release";

function App() {
  const { qrcode, showlogo, logoversion, cardshow, login, prodheader, release, headertext } = useFlags();
  
  return (
    <div className="App h-screen bg-ldls grid grid-rows-4 grid-cols-3 xl:grid-rows-4 xl:grid-cols-3 bg-cover bg-no-repeat">
      { prodheader ? (
        <header className="App-header grid row-start-1 col-span-3 xl:row-start-1 xl:col-span-4">
          <Header />
        </header>
      ):
      (
        <header className="App-header row-start-2 col-span-3 xl:row-start-2 xl:col-span-4">
        <div className="body bg-ldgray px-8 py-4 mb-5 w-full shadow-2xl">
          <p className="text-m xl:text-8xl font-bold">LaunchDarkly</p>
          <p className="text-m xl:text-4xl">Welcomes you to <span className="text-ldyellow">{headertext ? headertext : "No event name provided!"}</span>!</p>        
        </div>
        <Intro release={release} />
      </header>
        )
      }
      {qrcode ? (
        <div className="body grid row-start-2 col-span-3 xl:row-start-2 xl:col-span-4 bg-black-4 place-items-center">
            <QRCode /> 
        </div>
      ) : null}
      {login ? (
        <div className="body grid row-start-3 col-span-3 xl:row-start-3 xl:col-span-4 bg-black-4 place-items-center">
          <Login />
        </div>
      ) : null}
      {showlogo ? (
        <div className="body grid row-start-3 col-span-3 xl:row-start-3 xl:col-span-4 place-items-center">
          {logoversion ? (
            <img
              src={toggle}
              className="mx-auto h-56 lg:h-60 2xl:h-80"
              alt="logo"
            />
          ) : (
            <div className="">
              <img
                src={ldlogo}
                className="App-pulse mx-auto h-56 lg:h-60 2xl:h-80"
                alt="logo"
              />
            </div>
          )}
        </div>
      ) : (
        <div />
      )}
      {cardshow ? (
          <div className="body grid row-start-4 col-span-3 xl:row-start-4 xl:col-span-4 place-items-center">
            <Release />
          </div>
      ) : (
        null
      )}
    </div>
  );
}

export default App;
