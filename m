Return-Path: <winiston@futuraautomation.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 614B7E00C7D; Thu, 25 Feb 2016 04:47:49 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW,STOX_REPLY_TYPE autolearn=unavailable
	version=3.3.1
X-Spam-HAM-Report: *  0.4 STOX_REPLY_TYPE STOX_REPLY_TYPE
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.192.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9AEEE00C7D
	for <meta-ti@yoctoproject.org>; Thu, 25 Feb 2016 04:47:45 -0800 (PST)
Received: by mail-pf0-f178.google.com with SMTP id x65so32457670pfb.1
	for <meta-ti@yoctoproject.org>; Thu, 25 Feb 2016 04:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=futuraautomation-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:from:to:cc:references:in-reply-to:subject:date
	:mime-version:content-type:content-transfer-encoding:importance
	:disposition-notification-to;
	bh=4eumpCZUbS3SlrOcLReeNfGN4AGSS8piOrAmpQiYXEM=;
	b=NjXYMVVjQK4hCvj2M2wygSObsSdCr4jd5QfUb9tCRD2dEbwIaneJKb4IuQ37JBVM1k
	ntFTKuLr+cZXcf9jMq0kiJNSIbTPjfR0725XbmaoJHOLxG5TutN6/ZBoiN+iZIzwH+TS
	naQxqYpTB9Efro/LOnGNlz0UkVQPtUnHHD0hosDpuTy+NNSyJs9fyJjpXH0RugesbebP
	5qFekNinjgdEP4/DX9EBQVMufVZK4TLXiND097rpZbrG8Cu9ohnz8XuhmWX8rv44ZcVI
	z/rdyfl7xYOo6iIrTXc7Z+uRP6+iVUS+S4C7Wc0b5R58ccebx76P6277/HRvQ4wYwKSJ
	4yFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:to:cc:references:in-reply-to
	:subject:date:mime-version:content-type:content-transfer-encoding
	:importance:disposition-notification-to;
	bh=4eumpCZUbS3SlrOcLReeNfGN4AGSS8piOrAmpQiYXEM=;
	b=lJXAesiFczxC6uNjanlZIaGzeGzFAqf0HMvg/6An1vKtIFyl4O4JkAsqDYGXUdnymN
	fa28Vzy0aI28U14fko9AuCLMgOAd1tLYnPWr1nPBckoVv0XVug3Ue6XAENwipGmE9M7T
	rK2nJ81sFK2wlvGHt1qw9XaL1ScWUgdaYrIj3wwudJeD3nJ6ljec91rO5aOVCk6UT+J+
	W/xJHdfblrzhwRDHGTmohYjSBn0oTvLZMsgxDA7D9jOcentVFCVMtEspJU5rbydUDgfB
	6YZSx92oGN2160Af70Yle0too43ei0YeuRK9gMrzJdUJjMSOHPDanqWXEDMsHEojVFm1
	MKGA==
X-Gm-Message-State: AG10YOSlQ3Wy7U2ombeAACfi2Uwf3P59bLrzpVpH4LKigf1OuNvllY6ADe7ghgP2YvPWcQ==
X-Received: by 10.98.89.139 with SMTP id k11mr14330904pfj.56.1456404465391;
	Thu, 25 Feb 2016 04:47:45 -0800 (PST)
Received: from RD3 ([59.99.236.185]) by smtp.gmail.com with ESMTPSA id
	r77sm12210359pfa.47.2016.02.25.04.47.41
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Feb 2016 04:47:44 -0800 (PST)
Message-ID: <2CD39F82881F465AAD78DBB61BCA369E@RD3>
From: <winiston@futuraautomation.com>
To: "Maxin B. John" <maxin.john@intel.com>
References: <AB28D54196164B23BA942EBCF3204741@RD3>
	<20160224141143.GB2892@mbabyjoh-mobl.fi.intel.com>
In-Reply-To: <20160224141143.GB2892@mbabyjoh-mobl.fi.intel.com>
Date: Thu, 25 Feb 2016 18:21:25 +0530
MIME-Version: 1.0
X-Priority: 1
X-MSMail-Priority: High
Importance: High
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Cc: yocto texas <meta-ti@yoctoproject.org>,
	Yocto layer <linux-yocto@yoctoproject.org>,
	OpenEmbedded core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 25 Feb 2016 12:47:49 -0000
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit

Hi Maxin,

I copied "recipes-navigation" folder from meta-oe (Open embedded build tree) 
to "/poky/meta " . Then I have added the below line in  "/conf/local.conf" 
as given below.

IMAGE_INSTALL_append = " navit_svn"

Then I used bitbake to build the image. It spits out the following errors,

winiston@winiston-VirtualBox:~/poky/build$ bitbake qt4e-demo-image
Parsing recipes: 100% |########################| Time: 00:01:35
Parsing of 1073 .bb files complete (0 cached, 1073 parsed). 1509 targets, 
143 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'navit_svn' (but 
/home/winiston/poky/meta/recipes-qt/images/qt4e-demo-image.bb RDEPENDS on or 
otherwise requires it)
NOTE: Runtime target 'navit_svn' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['navit_svn']
ERROR: Required build target 'qt4e-demo-image' has no buildable providers.
Missing or unbuildable dependency chain was: ['qt4e-demo-image', 
'navit_svn']

Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
winiston@winiston-VirtualBox:~/poky/build$

What could be the problem? Where I have done the mistake ?


Regards,
Winiston.P
Futura Automation Pvt Ltd.

Ph :91-80-28375290 / 28375295
Fax :91-80-28375291
-----Original Message----- 
From: Maxin B. John
Sent: Wednesday, February 24, 2016 7:41 PM
To: winiston@futuraautomation.com
Cc: OpenEmbedded core ; Yocto layer ; yocto texas
Subject: Re: [OE-core] How to integrate third party application software to 
yocto image

Hi Winiston,

On Wed, Feb 24, 2016 at 06:20:14PM +0530, winiston@futuraautomation.com 
wrote:

> -- 
>Hi,
>
> I can build yocto image for arm based product like AM437x-evm using yocto 
> project. I want to add third party software(Navit) to my image.
>
> How can I add the third party software to my image ?. Can you provide me 
> the steps to integrate third party software with yocto image ?

Please read this documentation:
http://www.yoctoproject.org/docs/1.4.2/dev-manual/dev-manual.html#usingpoky-extend-addpkg

>   Note: Navit is a navigation software and it supports arm based product 
> like AM437x.
>

In the case of Navit, recipe is already available in meta-oe layer:
http://cgit.openembedded.org/cgit.cgi/meta-openembedded/tree/meta-oe/recipes-navigation/navit/navit_svn.bb?h=master

>    Host system: Ubuntu 14.04
>    Target system : AM437x-evm
>
>
>      Regards,
>      Winiston.P
>      Futura Automation Pvt Ltd.

Best Regards,
Maxin 


