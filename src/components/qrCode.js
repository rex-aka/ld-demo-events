import QRCode from "react-qr-code";

const QRURL = "http://forrestereu2.launchdarklydemos.com";

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
