Return-Path: <Rainer.Koenig@ts.fujitsu.com>
Received: from dgate10.ts.fujitsu.com (dgate10.ts.fujitsu.com [80.70.172.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15B71E013A8
	for <meta-ti@yoctoproject.org>; Wed, 14 Dec 2011 03:43:10 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1536-bit key; insecure key) header.i=Rainer.Koenig@ts.fujitsu.com;
	x-dkim-adsp=none (insecure policy)
DomainKey-Signature: s=s1536a; d=ts.fujitsu.com; c=nofws; q=dns;
	h=X-SBRSScore:X-IronPort-AV:Received:X-IronPort-AV:
	Received:Message-ID:Date:From:User-Agent:MIME-Version:To:
	Subject:X-Enigmail-Version:Content-Type:
	Content-Transfer-Encoding;
	b=ZgIsZQG76iNpY+BXj/bfHdQiRRXIQqvIOHRmBMz0XqvK8nLFMTN5Skkn
	37DsDSFACJT2QpX4jemNKqAHofz4J1kFneP+lnojJ+UGJCJ4s44KIcQiW
	LGMe0wh5DGixx2vLdyP/vqEFYLJ7q/wHGty0e6jy1uAaF2nWmCsjluwFG
	O7Mt8LFwpQm6Pv9iqTtZYuskepQeS74b4e8SYpH+R2+tylyprsN6bIsOF
	742aoxC57Yvb9IwknQveczipqHUJ4;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=ts.fujitsu.com; i=Rainer.Koenig@ts.fujitsu.com;
	q=dns/txt; s=s1536b; t=1323862991; x=1355398991;
	h=message-id:date:from:mime-version:to:subject:
	content-transfer-encoding;
	bh=IysS975C91j59ncQewkjFzAwUj2mwpqG5nKxHvI/knE=;
	b=M7414eWlBpRfUGLcjXGGL8aOmEJsxMHpYlfRxzxtefHGkz6ls3eSduNu
	kOqer36cjcD481Dsjg67UlY3tukOYizT3v9GltYbLtRTf+liFp2kE0Bqi
	oEBpB/HbQXODRNIeDw1y26IhveSF5dRFtX3dsS8m3LYnRcwc9ETuWTA/d
	KGa7pHn2Z4//yxLGD+wqJANo2w563zOr+jPGdUqTnae57MRRdagUGBPPo
	Gulrnk7Waci6URBaXOjL83lFrY2JH;
X-SBRSScore: None
X-IronPort-AV: E=Sophos;i="4.71,351,1320620400"; d="scan'208";a="95886452"
Received: from abgdgate30u.abg.fsc.net ([172.25.138.66])
	by dgate10u.abg.fsc.net with ESMTP; 14 Dec 2011 12:43:09 +0100
X-IronPort-AV: E=Sophos;i="4.71,351,1320620400"; d="scan'208";a="124990297"
Received: from abg3595c.abg.fsc.net (HELO [172.25.145.158]) ([172.25.145.158])
	by abgdgate30u.abg.fsc.net with ESMTP; 14 Dec 2011 12:43:08 +0100
Message-ID: <4EE88BCC.8070502@ts.fujitsu.com>
Date: Wed, 14 Dec 2011 12:43:08 +0100
From: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20111110 Icedove/3.0.11
MIME-Version: 1.0
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
X-Enigmail-Version: 1.0.1
Subject: Questions about ti-syslink-module
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
X-List-Received-Date: Wed, 14 Dec 2011 11:43:12 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit

Hi there,

still playing around with my dm814x-evm board and at least now I
successfully builded a systemd-gnome-image that runs if you add syslink
from the TI EZSDK 5.02 and some firmware files. I tried to build those
things, so I include ti-syslink-module in my build, and I also made a
recipe to copy the firmware binaries to the /usr/share/ti/... direcotries.

The problem is, that this image crashes as soon as I load the vpss
firmware.

At the moment I wonder if syslink is the cause of the problem. Looking
at the recipe in meta-ti I see that it builds a version 2_00_00_78, but
the EZSDK 5.02 uses 2_00_00_80.

The other thing that puzzles me is that my kernel config has
CONFIG_Sys_Link=y
CONFIG_SYSLINK_MULTIPROC=y
CONFIG_SYSLINK_NOTIFY=y

What part of syslink is that which is already in the kernel sources?

At the moment it looks all confusing and I guess that the crashes come
from version mixing, but I'm not sure.

Best regards
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

