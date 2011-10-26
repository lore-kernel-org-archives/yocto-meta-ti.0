Return-Path: <koen@beagleboard.org>
Received: from mail-fx0-f48.google.com (mail-fx0-f48.google.com
	[209.85.161.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 43D09E005BB
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2011 22:00:02 -0700 (PDT)
Received: by faap14 with SMTP id p14so1913233faa.35
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2011 22:00:01 -0700 (PDT)
Received: by 10.223.91.143 with SMTP id n15mr51043993fam.23.1319605201087;
	Tue, 25 Oct 2011 22:00:01 -0700 (PDT)
Received: from [10.192.5.224] ([85.13.70.251])
	by mx.google.com with ESMTPS id a21sm1849269fao.18.2011.10.25.21.59.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 25 Oct 2011 21:59:58 -0700 (PDT)
Message-Id: <CB6184BC-17D4-43C4-8BBA-2945CD411452@dominion.thruhere.net>
From: Koen Kooi <koen@beagleboard.org>
To: "Kridner, Jason" <jdk@ti.com>
In-Reply-To: <F61A9010E56D7F4C93A19FD36DAAC3590B9B9A@DFLE34.ent.ti.com>
Mime-Version: 1.0 (Apple Message framework v936)
Date: Wed, 26 Oct 2011 06:59:50 +0200
References: <1319587995-11126-1-git-send-email-joelagnel@ti.com>
	<F61A9010E56D7F4C93A19FD36DAAC3590B9B9A@DFLE34.ent.ti.com>
X-Mailer: Apple Mail (2.936)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Fernandes,
	Joel A" <joelagnel@ti.com>
Subject: Re: [PATCH meta-ti] linux-ti33x-psp 3.1rc8: Enable usb-to-serial drivers
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
X-List-Received-Date: Wed, 26 Oct 2011 05:00:02 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit


Op 26 okt 2011, om 06:01 heeft Kridner, Jason het volgende geschreven:

> Joel,
>
> This looks good to me.
>
> Can you also enable other types of USB host adapters?  We want to  
> have a fairly exhaustive set, including just about every USB-to- 
> serial adapter.
>
> I had been thinking that Koen has some mechanism where USB drivers  
> are registered after boot based on this set of messages in the  
> kernel bootlog:
>
> [    0.254977] usbcore: registered new interface driver catc
> [    0.254991] catc: v2.8:CATC EL1210A NetMate USB Ethernet driver
> [    0.255057] usbcore: registered new interface driver kaweth
> [    0.255074] pegasus: v0.6.14 (2006/09/27), Pegasus/Pegasus II USB  
> Ethernet driver
> [    0.255142] usbcore: registered new interface driver pegasus
> [    0.255157] rtl8150: v0.6.2 (2004/08/27):rtl8150 based usb- 
> ethernet driver
> [    0.255233] usbcore: registered new interface driver rtl8150
> [    0.255299] usbcore: registered new interface driver asix
> [    0.255366] usbcore: registered new interface driver cdc_ether
> [    0.255433] usbcore: registered new interface driver dm9601
> [    0.255500] usbcore: registered new interface driver cdc_subset
> [    0.255566] usbcore: registered new interface driver zaurus
> [    0.255623] cdc_ncm: 04-Aug-2011
> [    0.255693] usbcore: registered new interface driver cdc_ncm
> [    0.255817] usbcore: registered new interface driver cdc_acm
> [    0.255831] cdc_acm: USB Abstract Control Model driver for USB  
> modems and ISDN adapters
> [    0.255927] usbcore: registered new interface driver usblp
> [    0.255997] usbcore: registered new interface driver cdc_wdm
>
> However, looking at the defconfig, it seems these are just set as Y,  
> the same as you have done.

All those usb ethernet drivers and usb serial drivers should be made  
modules. That will also shrink the uImage size a bit :)

regards,

Koen

