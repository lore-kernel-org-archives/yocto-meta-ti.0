Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.444.1601560406263520781
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Oct 2020 06:53:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LTCkkAwz;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rogerq@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 091DrPsJ033063
	for <meta-ti@lists.yoctoproject.org>; Thu, 1 Oct 2020 08:53:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601560405;
	bh=hAGs1bE4IBsGuvlyy8OXVZOrVYd6Q10JMAz0/QW5LGM=;
	h=From:To:CC:Subject:Date;
	b=LTCkkAwz6vnjtGs4oMlznzO6w/yOx4PWHqY3f2xCz/EtUenM0qwU6a4DelYYAH2Fa
	 ac1+1m3ADIxazeJCWs1lix21uiPPysWe2UCCRiyIH+VCqA+v49xTT+io+hLjDO//8y
	 93IjLAgSYyiGvDPxYwRG9Qiw6xL9UU11xcWXBNbQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 091DrPWr053254
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 1 Oct 2020 08:53:25 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 1 Oct
 2020 08:53:24 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 1 Oct 2020 08:53:24 -0500
Received: from lta0400828a.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 091DrMMZ004447;
	Thu, 1 Oct 2020 08:53:23 -0500
From: "Roger Quadros" <rogerq@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <denys@ti.com>, <nsekhar@ti.com>, <vigneshr@ti.com>, <lokeshvutla@ti.com>,
        <dmurphy@ti.com>, Roger Quadros <rogerq@ti.com>
Subject: [meta-ti][dunfell/master PATCH 0/2] prueth/prusw: update firmwares
Date: Thu, 1 Oct 2020 16:53:19 +0300
Message-ID: <20201001135321.7470-1-rogerq@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Hi,

Update prueth-fw to v5.3.9 and prusw-fw to v3.1.4

cheers,
-roger

Roger Quadros (2):
  prueth-fw: Update the firmware to 5.3.9 version
  prusw-fw: Update the firmware to 3.1.4 version

 .../prueth-fw/{prueth-fw_5.2.8.bb => prueth-fw_5.3.9.bb}        | 2 +-
 recipes-bsp/prusw-fw/{prusw-fw_3.0.3.bb => prusw-fw_3.1.4.bb}   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename recipes-bsp/prueth-fw/{prueth-fw_5.2.8.bb => prueth-fw_5.3.9.bb} (94%)
 rename recipes-bsp/prusw-fw/{prusw-fw_3.0.3.bb => prusw-fw_3.1.4.bb} (94%)

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

