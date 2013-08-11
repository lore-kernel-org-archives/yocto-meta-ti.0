Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-07.prod.phx3.secureserver.net
	(p3plsmtpa09-07.prod.phx3.secureserver.net [173.201.193.236])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86D95E013A7
	for <meta-ti@yoctoproject.org>; Sun, 11 Aug 2013 08:41:25 -0700 (PDT)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa09-07.prod.phx3.secureserver.net with 
	id BThQ1m0021mTNtu01ThQMq; Sun, 11 Aug 2013 08:41:25 -0700
Message-ID: <5207B0A8.9070709@pabigot.com>
Date: Sun, 11 Aug 2013 10:41:28 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: dylan gstreamer-ti on linux 3.8
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sun, 11 Aug 2013 15:41:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm working on a DM3730-based Gumstix Overo, trying to bring the kernel 
up to 3.8.13 since the 3.5.x series doesn't have the V4L2 support I 
need.  Using the dylan branch of meta-ti I can build gstreamer-ti for a 
3.5.0 kernel, but not for 3.8.13.  The downward slide begins with 
ti-linuxutils-2_26_01_02 building cmem which blurts:

  warning: #warning *** not a warning *** Note: LINUX_VERSION_CODE >= 
2.6.26 [-Wcpp]

and starts choking on lack of VM_RESERVED because linux commit 
314e51b9851b4f4 for v3.7 replaced it with other flags.  This can be 
patched (though I'd have to try to figure out which flag set is 
intended), but the build then gets into trouble in 
sdma/src/module/sdmak.c because plat/hardware.h disappeared in 
dbc04161048, also first appearing in v3.7.

At this point I noticed that linuxutils is up to 4.0.0.6 which supplies 
only cmemk, which I think is all I need (and which I think I really do 
need).  Great, except it uses autotools and doesn't have an 
install_modules target so the trivial replacement recipe doesn't work.

So: What is the recommended path to get gstreamer-ti to function on a 
DM3730 with kernel 3.8 and/or 3.10?

Thanks.

Peter

