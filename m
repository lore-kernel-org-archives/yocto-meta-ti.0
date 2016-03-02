Return-Path: <winiston@futuraautomation.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 691C0E00D0E; Wed,  2 Mar 2016 00:49:26 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW,STOX_REPLY_TYPE autolearn=unavailable
	version=3.3.1
X-Spam-HAM-Report: *  0.4 STOX_REPLY_TYPE STOX_REPLY_TYPE
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.46 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA258E00D13
	for <meta-ti@yoctoproject.org>; Wed,  2 Mar 2016 00:49:23 -0800 (PST)
Received: by mail-pa0-f46.google.com with SMTP id fl4so129169372pad.0
	for <meta-ti@yoctoproject.org>; Wed, 02 Mar 2016 00:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=futuraautomation-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:from:to:references:in-reply-to:subject:date:mime-version
	:content-transfer-encoding:importance;
	bh=PoEvkNOvfN7QFlFCybYHjYOFwvJ8xiFn7nBwioTmo4A=;
	b=Aj0SV0XGiArc/Tn4/uwqlAX/yi346nEHAUeDO4vVaZbOM0XX0O/CFKSAVc+DkVwE3N
	/dciAb7Nao+lDddQHj9E9d0x5i/r3K4fMBlLPmexQBDXHrgrAUfVikdki+uuxILwRAUO
	+dPGxFBew2a8Wwwh+z06Yxu0XREg5coLJ5HrY7MBlLpn8UwMlLLDcrixnaO1lmXeMTbw
	i0VZNOm6HDGaCpX5kkzuF0uS1gc2FcPaqQsh9cvqXM5n0ZXlKnpRPESlRkTk+vqLIBgu
	SOrKdRQDep7sA3BLta/rlshsIgcxsSHriN12VZdnd6/JKe6MZ7vn4cKYGgdeJL/DeAfd
	y3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:to:references:in-reply-to
	:subject:date:mime-version:content-transfer-encoding:importance;
	bh=PoEvkNOvfN7QFlFCybYHjYOFwvJ8xiFn7nBwioTmo4A=;
	b=b1+hBlEXgqTJfNks/CaZxHAvObQXaPfQAXanBAIohRIATeUStzQyFdOwVj8QsBqDZf
	PPw6uxAKXtiypjZgzd61c0TMAoTH/xKqnrDHgmqwto+ZJ1pcccJftcEebveC77RdzFmN
	8Mh6FrEi/50aOHEs9U+G7Y9KJq8LxWg20Je8EiinvieDp87cNGtk/LzIbSGJTNVwPl+y
	5zoVaINpbPSx4D3v13NpEr8/Lou/77DpMl90LWoI1exbLVfdo4o61DyhmuvPsaQwBRgv
	IRPZJgzTdAIlOCT3hOk1K6pB5xEdXMGgd0SXnpi2iCZBcRYkmpV1zQbAM2EjTSoTAKwS
	ftQg==
X-Gm-Message-State: AD7BkJIM/1AzPFdGWd4GvyJf+byHTSYTJsuP7kRww8xmk+1S2invF0LlkzIbvHWz+5dllw==
X-Received: by 10.66.237.39 with SMTP id uz7mr24666471pac.141.1456908563643;
	Wed, 02 Mar 2016 00:49:23 -0800 (PST)
Received: from RD3 ([59.99.236.185]) by smtp.gmail.com with ESMTPSA id
	h19sm9085040pfh.43.2016.03.02.00.48.50
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Mar 2016 00:49:22 -0800 (PST)
Message-ID: <38408F728A334E9F9A452EFD2448CC8D@RD3>
From: <winiston@futuraautomation.com>
To: "Anders Darander" <anders@chargestorm.se>,
	<openembedded-core@lists.openembedded.org>,
	"yocto texas" <meta-ti@yoctoproject.org>,
	"Yocto layer" <linux-yocto@yoctoproject.org>
References: <AB28D54196164B23BA942EBCF3204741@RD3><20160224141143.GB2892@mbabyjoh-mobl.fi.intel.com><2CD39F82881F465AAD78DBB61BCA369E@RD3><CAJTo0LYMO4C9+rd1NG7mMmn4YfU6vRhuOYni4vvPAugoru=uwA@mail.gmail.com><E744C7D53BB7428AB0FD15C117627D11@RD3>
	<20160226093319.GA4329@ad.chargestorm.se>
In-Reply-To: <20160226093319.GA4329@ad.chargestorm.se>
Date: Wed, 2 Mar 2016 14:22:16 +0530
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
Importance: Normal
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Subject: Re: [OE-core] How to integrate third party application software to yocto image
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
X-List-Received-Date: Wed, 02 Mar 2016 08:49:26 -0000
Content-Type: text/plain; format=flowed; charset="UTF-8"; reply-type=original
Content-Transfer-Encoding: 8bit

Hi,

I am new to this community.What does mean top post? Please see my 
bblayers.conf file content.

# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
# changes incompatibly
LCONF_VERSION = "6"

BBPATH = "${TOPDIR}"
BBFILES ?= ""

BBLAYERS ?= " \
  /home/winiston/poky/meta \
  /home/winiston/poky/meta-yocto \
  /home/winiston/poky/meta-yocto-bsp \
  /home/winiston/poky/meta-ti \
  /home/winiston/poky/meta-oe \
  /home/winiston/poky/meta-multimedia \
  /home/winiston/poky/meta-qt5 \
  "
BBLAYERS_NON_REMOVABLE ?= " \
  /home/winiston/poky/meta \
  /home/winiston/poky/meta-yocto \
  "
#added by hob
BBFILES += "${TOPDIR}/recipes/images/custom/*.bb"
#added by hob
BBFILES += "${TOPDIR}/recipes/images/*.bb"


I have copied  meta-oe , meta-multimedia and meta-qt5 from meta-openembedded 
to  /home/winiston/poky.

It spits out the same error. Log output as given below.

winiston@winiston-VirtualBox:~/poky/build$ bitbake core-image-base
Parsing recipes: 100% |########################| Time: 19:17:59
Parsing of 1760 .bb files complete (0 cached, 1760 parsed). 2285 targets, 
196 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'navit' (but 
/home/winiston/poky/meta/recipes-core/images/core-image-base.bb RDEPENDS on 
or otherwise requires it)
ERROR: navit was skipped: Recipe is blacklisted: bluez5 conflicts with 
bluez4 and bluez5 is selected in DISTRO_FEATURES
NOTE: Runtime target 'navit' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['navit']
ERROR: Required build target 'core-image-base' has no buildable providers.
Missing or unbuildable dependency chain was: ['core-image-base', 'navit']

Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
winiston@winiston-VirtualBox:~/poky/build$


1. What could be the problem? Since I could not proceed my project, Kindly 
help me to solve this issue.



Regards,
Winiston.P
Futura Automation Pvt Ltd.

Ph :91-80-28375290 / 28375295
Fax :91-80-28375291
-----Original Message----- 
From: Anders Darander
Sent: Friday, February 26, 2016 3:03 PM
To: openembedded-core@lists.openembedded.org ; yocto texas ; Yocto layer
Subject: Re: [OE-core] How to integrate third party application software to 
yocto image

Hi,

Please, don't top post.

* winiston@futuraautomation.com <winiston@futuraautomation.com> [160226 
06:41]:
> I copied "recipes-navigation" folder from meta-oe (Open embedded build 
> tree) to "/poky/meta "

> I have appended  in “conf/local.conf”  as given below

> IMAGE_INSTALL_append = " navit"

> While creating the image, it spits out the following error,

> winiston@winiston-VirtualBox:~/poky/build$ bitbake qt4e-demo-image
> Loading cache: 100% |##########################| ETA:  00:00:00
> Loaded 1510 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'navit' (but 
> /home/winiston/poky/meta/recipes-qt/images/qt4e-demo-image.bb RDEPENDS on 
> or otherwise requires it)
> ERROR: navit was skipped: Recipe is blacklisted: bluez5 conflicts with 
> bluez4 and bluez5 is selected in DISTRO_FEATURES

This is the error. You have bluez5 in your DITRO_FEATURES, and I assume
that navit requires bluez4? Anywya, it's blacklisted.

> NOTE: Runtime target 'navit' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['navit']
> ERROR: Required build target 'qt4e-demo-image' has no buildable providers.
> Missing or unbuildable dependency chain was: ['qt4e-demo-image', 'navit']

> Summary: There were 2 ERROR messages shown, returning a non-zero exit 
> code.
> winiston@winiston-VirtualBox:~/poky/build$

> Should I make any other setting to add the “navit” recipe to my image?
> Is this the correct method of copying  "recipes-navigation" folder  to
> "/poky/meta "  ?

Well, it works. If you don't mind the rest of meta-oe, I'd rather add
that layer to conf/bblayers.conf. That would make it easier to get
updates to e.g. navit.

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB
-- 
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core 


