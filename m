Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4776EE01404
	for <meta-ti@yoctoproject.org>; Wed,  1 Aug 2012 20:59:20 -0700 (PDT)
Received: by eaab14 with SMTP id b14so2182407eaa.35
	for <meta-ti@yoctoproject.org>; Wed, 01 Aug 2012 20:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=0QfVbAh+KGxldXFo+g0IFkUUto0dVYnLD5A5zt1mYj8=;
	b=O3KFNiHLi8Mxt+yx1w8gJc1zsqFS/WIvUjuMXxtj5SJa5wI9SY6JFslEout/8rA2yV
	eT89X4BGJZOyTdFmqxgodtLQbz+Qu1lq9Zf+9JaHkAm5BTs9ojw0842vaUYxIbxJQ80d
	vQA6B3/QBpN/JV9A3FjhILkNFhefn4062R40ayd+6iuDjUlzKhZVEeDZEPKfbVu1d7EI
	xgCTtoWbOMyPYaXEgoTte7V4Lk4HiAOpNm+1Fw6BMohcDHlEJ6IWgxy0D4di9hw1dB3l
	MDpfyoaQajiN5+fDeAoUncxLrPEVGHE3YpjTAzEXzn5alfOSMhGUMraq779/GSlQJ9GW
	RCdA==
Received: by 10.14.178.7 with SMTP id e7mr25066604eem.20.1343879958988;
	Wed, 01 Aug 2012 20:59:18 -0700 (PDT)
Received: from [172.20.0.6] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id 9sm13804816eei.12.2012.08.01.20.59.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 20:59:17 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C27E75F@DFLE30.ent.ti.com>
Date: Thu, 2 Aug 2012 05:59:20 +0200
Message-Id: <102FAACD-FA2C-45CD-B8E8-E1BF93554183@dominion.thruhere.net>
References: <8F29D6B095ED194EA1980491A5E029710C27E75F@DFLE30.ent.ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQkFPZ//h/xLTSy8+cF7GdOpz2NwpEVUZNLGU7Tkk7Ml+oIMdObfigdM+ee2Sw3K3YpvJtVb
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [branch: master][PATCHES] Porting netbase interfaces file from oe-classic
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
X-List-Received-Date: Thu, 02 Aug 2012 03:59:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Please send patches inline to make review easier.

Patch 1:

> * Add PR_append

Don't do that, that's what PRINC is for

> * Pull in the base interface file from oe-core

Completely unneeded

> * Update to use the new syntax for extending the file search path

Patch 2:

> Update interface file based on changes made to the interface file
  in arago

THe interfaces file is supposed to be machine specific, so a "one file =
to rule them all" is completely unacceptable in meta-ti. If you want to =
go such a route, do it in meta-arago. Even so, I strongly recommend =
against that.

Op 1 aug. 2012, om 21:07 heeft "Cooper Jr., Franklin" <fcooper@ti.com> =
het volgende geschreven:

> Attached patches are for porting the netbase interface file used in =
arago/oe-classic to meta-ti.
> =20
> The difference between my interfaces file and the one in beagleboard =
directory seems very minor. Would it be ok to combine the changes from =
both files into a single file? The auto usb0 looks like it might be an =
issue if we combined the two files. Would it make sense to append that =
line to the interface file during do_install_append step only for the =
beagleboard platform and consolidate the rest of the differences?
> =20
> diff beagleboard/interfaces interfaces
> 13a14,17
> > iface tiwlan0 inet dhcp
> >    wireless_mode managed
> >    wireless_essid any
> >
> 18a23,24
> >         pre-up /bin/grep -v -e =
"ip=3D[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" /proc/cmdline > /dev/null
> >
> 21,22c27,28
> < # Ethernet/RNDIS gadget (g_ether) or LAN9514 on BeagleBoard xM
> < auto usb0
> ---
> > # Ethernet/RNDIS gadget (g_ether)
> > # ... or on host side, usbnet and random hwaddr
> =20
> =20
> Regards,
> Franklin Cooper Jr.
> Texas Instruments
> Application Engineer
> fcooper@ti.com
> =20
> =
<0001-netbase-Add-base-interface-file.patch><0002-netbase-Update-interface=
-file.patch>_______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


