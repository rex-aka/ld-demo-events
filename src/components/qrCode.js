import QRCode from "react-qr-code";

const QRURL = process.env.REACT_APP_QRURL;

const qrCodeHome = () => {  
  return (
    <div className="mx-auto shadow-2xl">
      <div className="qr-wrapper">
        <QRCode size="200" value={QRURL} />
      </div>
    </div>
  )     
};

export default qrCodeHome;
