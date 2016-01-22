Return-Path: <winiston@futuraautomation.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 94BE5E00903; Fri, 22 Jan 2016 01:34:48 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DEAR_SOMETHING,
	DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_LOW,STOX_REPLY_TYPE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: *  0.4 STOX_REPLY_TYPE STOX_REPLY_TYPE
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.192.181 listed in list.dnswl.org]
	*  2.0 DEAR_SOMETHING BODY: Contains 'Dear (something)'
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73774E00803
	for <meta-ti@yoctoproject.org>; Fri, 22 Jan 2016 01:34:43 -0800 (PST)
Received: by mail-pf0-f181.google.com with SMTP id n128so39317660pfn.3
	for <meta-ti@yoctoproject.org>; Fri, 22 Jan 2016 01:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=futuraautomation-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:from:to:cc:subject:date:mime-version:content-type
	:content-transfer-encoding:importance;
	bh=6X9/7W/GtP9CEYbzFD1nm2DmWOmY2j+3NHK11x29Kf0=;
	b=ZgmRmIFndL3xPa6yNcaBu4yn32sonU1iVKZm+5dXyjhLLwu+S6tUpSKLGMP6P1wFT3
	WGW3ZLNLDvsq1IrDZodP1Nup914LqhAAjrZmRUU0a87qOCf1HFpK8R68VuLUU5YKuucN
	qyItxCK2XyltchkTdhO4EowyUC7vuTwPGzeVJsa+IpDSQaE/Ienr0SPxYTmw98vtQ1MZ
	HsX+w6Y5hXDYF7rG9gkOD7cvt9RuN/kpPu7ei9AvYmPqevKq7AF5ULNiW21IpBYHsZhb
	xp0lVW5yqLfQwMxb8Lj1dUXtFWMCWLD9St6nn9LziVH0UABAbYtnULGsJ4OsSHhHpOcn
	jRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:to:cc:subject:date:mime-version
	:content-type:content-transfer-encoding:importance;
	bh=6X9/7W/GtP9CEYbzFD1nm2DmWOmY2j+3NHK11x29Kf0=;
	b=lnV9ybdo98AFEcIKx6SuR3qZ1W1iDqqHbXNpLHdHjPH8+DlXirPf1J6AciTYoTjzZt
	I1m1ZpLnwQ0bsRSO4pm6lknV4Jt4qgjVeEqck2zTZEy3Y8FEvdbh3iz9XNAdGbG2RZA+
	7dky6VSaHTF+Igqjr3DSDsBI2dflu3PJEyQChiUElUx3+FoeOcgwSYyRKMMjjUrT0/kr
	k3T6jpHSJedXuU2NGePZ0AxS+3XSEUlvga5NWhgC5WFYrt2NdHwBboIwZgF2NxgFdaYz
	lJAnM6IhH0eClM9Qwy+O/4KGAqr6q+vYKWckBIK1LtEp4XjKeQ265HTZHiNUY+gtFOCN
	DOkA==
X-Gm-Message-State: AG10YOR/LIVfbPFDgkLl/9ikHyvPwLLmKM5qsSmKKiIzAz1i60ulg+708I98bDAh2wdNZg==
X-Received: by 10.98.79.4 with SMTP id d4mr2925409pfb.46.1453455283542;
	Fri, 22 Jan 2016 01:34:43 -0800 (PST)
Received: from RD3 ([59.99.236.185])
	by smtp.gmail.com with ESMTPSA id sy5sm8329533pac.5.2016.01.22.01.34.40
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 01:34:42 -0800 (PST)
Message-ID: <658BC03B3C98427EAF63EC34CDF954A2@RD3>
From: <winiston@futuraautomation.com>
To: "Denys Dmytriyenko" <denys@ti.com>
Date: Fri, 22 Jan 2016 15:09:05 +0530
MIME-Version: 1.0
X-Priority: 1
X-MSMail-Priority: High
Importance: High
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Cc: yocto texas <meta-ti@yoctoproject.org>
Subject: Re: Regarding Texas AM437x with yocto project
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
X-List-Received-Date: Fri, 22 Jan 2016 09:34:48 -0000
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit

Dear,

I tried to build default yocto image for x86 processor using poky. I used 
the command (bitbake core-image-minimal ) to build the image after 
initialize
the build environment (source oe-init-build-env) . It started 
building/downloading the image and stopped in 1004 th package .
Please find the attached document for referrence. What could be the reason 
to stop?
It is not downloading the package.I waited for more than 2 hours. My 
internet connection is still working
properly. How do I build the image?

I am waiting your reply.


Regards,
Winiston.P
Futura Automation Pvt Ltd.

Ph :91-80-28375290 / 28375295
Fax :91-80-28375291
-----Original Message----- 
From: Denys Dmytriyenko
Sent: Wednesday, January 20, 2016 1:35 AM
To: winiston@futuraautomation.com
Cc: Khem Raj ; yocto texas
Subject: Re: [meta-ti] Regarding Texas AM437x with yocto project

You'd need to add meta-ti layer into your OpenEmbedded/Yocto Project setup
and
build for am437x-evm machine.

-- 
Denys


On Tue, Jan 19, 2016 at 05:21:03PM +0530, winiston@futuraautomation.com
wrote:
> Dear Khem Raj,
> Thanks for your mail. I followed the yocto project documentation.
> Now I am able to build the embedded linux for x86 system using poky
> 14.0.
> But I want  to build embedded linux for ARM based AM437x (Texas
> ).How do I use AM437x 's BSP and uboot  for this build ?. What are
> the changes needs to be done?
>
> System configuration :
> Host System   :  Ubuntu 14.04.3
> Target system           : AM437x ( TI based)
> Note : I have downloaded AM437x  BSP from TI website. I have the
> uboot for the same. How do II  make use of it?
>
>
> Regards,
> Winiston.P
> Futura Automation Pvt Ltd.
>
> Ph :91-80-28375290 / 28375295
> Fax :91-80-28375291
> -----Original Message----- From: Khem Raj
> Sent: Tuesday, January 19, 2016 11:12 AM
> To: winiston@futuraautomation.com
> Cc: yocto texas
> Subject: Re: [meta-ti] Regarding Texas AM437x with yocto project
>
> On Mon, Jan 18, 2016 at 8:38 PM,  <winiston@futuraautomation.com> wrote:
> >Dear Sir/Madam,
> >
> >I plan to use Yocto project in our new project. Our development system is
> >Texas based AM437X.  I am new to yocto project. How do I start the
> >project?
> >Note : We are keen to develop embedded linux with navit
> >(Navigation software
> >).
> >
>
> There are good documentation and tutorials
>
> e.g.
>
> https://www.yoctoproject.org/documentation
> https://www.yoctoproject.org/tools-resources/videos
> https://www.yoctoproject.org/tools-resources/training
> https://www.yoctoproject.org/tools-resources/presentations
>
> >Regards,
> >Winiston.P
> >Futura Automation Pvt Ltd.
> >
> >Ph :91-80-28375290 / 28375295
> >Fax :91-80-28375291
> >
> >
> >--
> >_______________________________________________
> >meta-ti mailing list
> >meta-ti@yoctoproject.org
> >https://lists.yoctoproject.org/listinfo/meta-ti
> >
>
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti 


