Return-Path: <Rainer.Koenig@ts.fujitsu.com>
Received: from dgate20.ts.fujitsu.com (dgate20.ts.fujitsu.com [80.70.172.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DD08BE00309
	for <meta-ti@yoctoproject.org>; Thu, 24 Nov 2011 00:08:52 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1536-bit key; insecure key) header.i=Rainer.Koenig@ts.fujitsu.com;
	x-dkim-adsp=none (insecure policy)
DomainKey-Signature: s=s1536a; d=ts.fujitsu.com; c=nofws; q=dns;
	h=X-SBRSScore:X-IronPort-AV:Received:X-IronPort-AV:
	Received:Message-ID:Date:From:User-Agent:MIME-Version:To:
	Subject:X-Enigmail-Version:Content-Type:
	Content-Transfer-Encoding;
	b=O+DlwnRp8vkH+AE2wChF0G9kwJBRU8UDd+jR5+WzrP0O6MrJqwaXmWOz
	R/Qk+pgkdRBqEYVMsPjpHdh87yi85EWrAXAmpIqGAs/yArlHFGe45Hl9W
	+1ilks6qojM6bNk7stUa6EJmENVp1MS9FmdPRAD9+40zRtT4wclzKrX4u
	ZsVmbl4pVldOitPz0nTRg7RvvRBGksU59c3D4vs+jMSAS8EU6mPU/+ONQ
	8tWQ9c0pwIp7Xu5tX1efRaTZtEL3x;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=ts.fujitsu.com; i=Rainer.Koenig@ts.fujitsu.com;
	q=dns/txt; s=s1536b; t=1322122133; x=1353658133;
	h=message-id:date:from:mime-version:to:subject:
	content-transfer-encoding;
	bh=T7m2faxeeC/PhtY6xddjVOq+gHlP/VOC4uZihR5eXd4=;
	b=dew6M2tCJu00sQyYA0oE4pCrVroV64kMZX+AAwrqbIvGl3vhNK4+tWiD
	v+16NuyHtAasNdqkquuMm4bDG+Q9AIGJh7H7kpQGhrCRjSLdU5n4eaAdC
	UjjvZhh1skanPRuLMZ+DCozNOh1iFP3vuDz/WI3WMo30cGz0bey87VCwL
	kWs33vIpI9OZG5c7ok8by42cQL/k9Z2amVNPyociKv8stsDVT3Q+41sCp
	906AD591mP4LaSwNFxLCwk6XzTM1Z;
X-SBRSScore: None
X-IronPort-AV: E=Sophos;i="4.69,563,1315173600"; d="scan'208";a="79768818"
Received: from abgdgate40u.abg.fsc.net ([172.25.138.90])
	by dgate20u.abg.fsc.net with ESMTP; 24 Nov 2011 09:08:50 +0100
X-IronPort-AV: E=Sophos;i="4.69,563,1315173600"; d="scan'208";a="124064007"
Received: from abg3595c.abg.fsc.net (HELO [172.25.145.158]) ([172.25.145.158])
	by abgdgate40u.abg.fsc.net with ESMTP; 24 Nov 2011 09:08:50 +0100
Message-ID: <4ECDFB92.10203@ts.fujitsu.com>
Date: Thu, 24 Nov 2011 09:08:50 +0100
From: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20111110 Icedove/3.0.11
MIME-Version: 1.0
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
X-Enigmail-Version: 1.0.1
Subject: SRC_URI points to local domain:
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Nov 2011 08:08:54 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit

Hi,

just tried to integrate ti-syslink in my build, but that pulls ti-cgt6x
in and that can't fetch. Reason:

$ find -type f | xargs grep SRC_URI | grep "local/"
./recipes-ti/hdvpss/ti-hdvpss.inc:SRC_URI =
"http://install.source.dir.local/REL.HDVPSS.${PV}.zip"
./recipes-ti/devtools/ti-cgt6x.inc:SRC_URI =
"http://install.source.dir.local/ti_cgt_c6000_${PVwithdots}_setup_linux_x86.bin;name=cgt6xbin"
./recipes-ti/devtools/ti-cgt470.inc:SRC_URI =
"http://install.source.dir.local/ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin;name=cgt470bin"

So we have 3 recipes that won't fetch. Root cause seems that you need to
get approved when downloading cgt6x from the TI website. Any hope that
this will change? Or do I need to setup my own local storage as well and
change the recipes?

Regards
Rainer
-- 
Dipl.-Inf. (FH) Rainer Koenig
Project Manager Linux Clients
Dept. PDG WPS R&D SW OSE

Fujitsu Technology Solutions
Bürgermeister-Ullrich-Str. 100
86199 Augsburg
Germany

Telephone: +49-821-804-3321
Telefax:   +49-821-804-2131
Mail:      mailto:Rainer.Koenig@ts.fujitsu.com

Internet         ts.fujtsu.com
Company Details  ts.fujitsu.com/imprint.html

