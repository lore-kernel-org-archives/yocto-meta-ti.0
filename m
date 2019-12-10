Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.2143.1576006815562263928
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 10 Dec 2019 11:40:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fCyPtRRh;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: denys@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBAJe95m072219;
	Tue, 10 Dec 2019 13:40:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576006809;
	bh=ocUATVNS2YggkKGIEqcI57/p8i8TV1xYwcg9VG9LUmE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=fCyPtRRhfeHNslltTCcUYpzxT7JhasaHTsS2PXwQoBrX32ICvEFEyhLIBnecy7dTc
	 ohZ9wQZ0vSYR6F00CVW+I7DwmPcPmIOxjANHrVGZN9b2U1wnuuZ6MTP0I9w1/N/nUw
	 zA/sZhpSNXeGcZ9jggIZLt+6iWqL8IytZlIlgijc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBAJe8D9092226
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 10 Dec 2019 13:40:09 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 10
 Dec 2019 13:40:08 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 10 Dec 2019 13:40:08 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBAJe8Et100537;
	Tue, 10 Dec 2019 13:40:08 -0600
Date: Tue, 10 Dec 2019 14:40:08 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi@gallagher.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [PATCH][thud,master] am335x-evm.conf: Use soft assignment for MKUBIFS_ARGS, UBINIZE_ARGS
Message-ID: <20191210194008.GJ11359@beryl>
References: <20191203052106.5254-1-ankur.tyagi@gallagher.com>
 <8881.1576006687300296709@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <8881.1576006687300296709@lists.yoctoproject.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?h=thud&id=90c7b65cb44aef370163382f67beedaf42c435cf

On Tue, Dec 10, 2019 at 11:38:07AM -0800, Ankur Tyagi wrote:
> ping
> 
> On Mon, Dec 2, 2019 at 09:21 PM, Ankur Tyagi wrote:
> 
> > 
> > This is allow user to override them in their configuration
> > 
> > Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
> > ---
> > conf/machine/am335x-evm.conf | 4 ++--
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
> > index 92e6cf05..8bfbee84 100644
> > --- a/conf/machine/am335x-evm.conf
> > +++ b/conf/machine/am335x-evm.conf
> > @@ -24,7 +24,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> > # UBI: logical eraseblock size: 126976 bytes
> > # from ubiattach stdout:
> > # UBI device number 0, total 1988 LEBs
> > -MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 9900"
> > +MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 9900"
> > 
> > # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
> > # from dmesg:
> > @@ -32,4 +32,4 @@ MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 9900"
> > # UBI: physical eraseblock size: 131072 bytes (128 KiB)
> > # UBI: sub-page size: 512
> > # UBI: VID header offset: 2048 (aligned 2048)
> > -UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
> > +UBINIZE_ARGS ?= "-m 2048 -p 128KiB -s 512 -O 2048"
> > --
> > 2.17.1
> > 
> > 
> > ###########################################################################
> > 
> > This email is confidential and may contain information subject to legal
> > privilege. If you are not the intended recipient please advise us of our
> > error by return e-mail then delete this email and any attached files.
> > You may not copy, disclose or use the contents in any way.
> > 
> > The views expressed in this email may not be those of Gallagher Group
> > Ltd or subsidiary companies thereof.
> > ###########################################################################
> >

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#12562): https://lists.yoctoproject.org/g/meta-ti/message/12562
> Mute This Topic: https://lists.yoctoproject.org/mt/65524593/1051543
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub  [denys@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-

