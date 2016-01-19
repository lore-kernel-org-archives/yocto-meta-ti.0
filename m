Return-Path: <winiston@futuraautomation.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1FA35E00A27; Tue, 19 Jan 2016 03:46:44 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DEAR_SOMETHING,
	DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_LOW,STOX_REPLY_TYPE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: *  0.4 STOX_REPLY_TYPE STOX_REPLY_TYPE
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.51 listed in list.dnswl.org]
	*  2.0 DEAR_SOMETHING BODY: Contains 'Dear (something)'
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2B32E008F5
	for <meta-ti@yoctoproject.org>; Tue, 19 Jan 2016 03:46:39 -0800 (PST)
Received: by mail-pa0-f51.google.com with SMTP id cy9so450514699pac.0
	for <meta-ti@yoctoproject.org>; Tue, 19 Jan 2016 03:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=futuraautomation-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:from:to:cc:references:in-reply-to:subject:date
	:mime-version:content-type:content-transfer-encoding:importance
	:disposition-notification-to;
	bh=LjXjHD6SdnpC92tdzGqjVrhORylCSyh2rxDRsfUTxu0=;
	b=jGOgjyo1uvQi2TYhXJuT4iYQCSyUcsJY7Lr3uhqntU1JMWUjAaCztKZaxvCGyUe7tq
	JasBdkBflBI4ajCs1mwrgUb/s3U060iwG+j9SBkHymn3fqisxxC2Eyj5okUxFUkCT2Yy
	Lf22QUPBcg3RGBQpDVKIFzibdaJmXTjot2iX/Sd2SaXYsCDT16kXbmPZaMLeIAzR8NKU
	b09bxAs0yZJYpcYL8LoHmlfpyg2zGNHVvrHpv2xdO1CG6S2ga1ZGQ7iwmw+IcrFcyeYP
	PeIfciC6KRBxS16jzpPLX2wl7vU9RVczaZimHHZjBTbKEVNngb7/R+GLkIbV0PYIm2tm
	G68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:to:cc:references:in-reply-to
	:subject:date:mime-version:content-type:content-transfer-encoding
	:importance:disposition-notification-to;
	bh=LjXjHD6SdnpC92tdzGqjVrhORylCSyh2rxDRsfUTxu0=;
	b=O2klBcWK/tFtrTd8TS3NU5Dm8g1PfaujBB8OPsesYMiLbNpwNMNUrX+YqqWYwA/ElM
	ZEBb/eFisjJdymuxPtS1Fl0zlCdK7iP/q+Hml15DSZSJSMFyYuQoMrKt7bAFwW3wByQ8
	pvGKJchNNqE6hHFGKsucXqxT7JlPr8srgVRmGB9J6y4+P4TbA3Wbi0CI3nBq3ZsEpG72
	SrfoQf+RwIkEr6yr7Y0/LbOMQD2WGrOTcC9UgOmAPTPyCQqlZfFaby5uCUkl+uCKaMuB
	wnuUbz2FFreyCnyz342gss/kSBV3QotF0QkWB9x7zHKIzsl51UFG9ndOIRRb56sGHdvr
	Vp9g==
X-Gm-Message-State: ALoCoQl2Ipo70IrpAfmKIa/8VepqoXSC5zwjwKavoEj8i5KAlncUuajPgQEGXtBmlFsODnotnVEOdBy9E4mTiUAqnfB8IEEfuA==
X-Received: by 10.66.192.42 with SMTP id hd10mr42824227pac.111.1453203999669; 
	Tue, 19 Jan 2016 03:46:39 -0800 (PST)
Received: from RD3 ([59.99.236.185]) by smtp.gmail.com with ESMTPSA id
	73sm35050005pfp.50.2016.01.19.03.46.36
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Jan 2016 03:46:38 -0800 (PST)
Message-ID: <B0C19B9E19864092A51969B8122A1C7E@RD3>
From: <winiston@futuraautomation.com>
To: "Khem Raj" <raj.khem@gmail.com>
References: <010D464DD7F94DAB8203AA5BF850771E@RD3>
	<CAMKF1sqNBo_a-TCoNE7qULy_JdGaDp7Kx8QqotYa0M_UpUV6zQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqNBo_a-TCoNE7qULy_JdGaDp7Kx8QqotYa0M_UpUV6zQ@mail.gmail.com>
Date: Tue, 19 Jan 2016 17:21:03 +0530
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
X-List-Received-Date: Tue, 19 Jan 2016 11:46:44 -0000
Content-Type: text/plain; format=flowed; charset="UTF-8"; reply-type=original
Content-Transfer-Encoding: 7bit

Dear Khem Raj,
Thanks for your mail. I followed the yocto project documentation. Now I am 
able to build the embedded linux for x86 system using poky 14.0.
But I want  to build embedded linux for ARM based AM437x (Texas ).How do I 
use AM437x 's BSP and uboot  for this build ?. What are the changes needs to 
be done?

System configuration :
Host System   :  Ubuntu 14.04.3
Target system           : AM437x ( TI based)
Note : I have downloaded AM437x  BSP from TI website. I have the uboot for 
the same. How do II  make use of it?


Regards,
Winiston.P
Futura Automation Pvt Ltd.

Ph :91-80-28375290 / 28375295
Fax :91-80-28375291
-----Original Message----- 
From: Khem Raj
Sent: Tuesday, January 19, 2016 11:12 AM
To: winiston@futuraautomation.com
Cc: yocto texas
Subject: Re: [meta-ti] Regarding Texas AM437x with yocto project

On Mon, Jan 18, 2016 at 8:38 PM,  <winiston@futuraautomation.com> wrote:
> Dear Sir/Madam,
>
> I plan to use Yocto project in our new project. Our development system is
> Texas based AM437X.  I am new to yocto project. How do I start the 
> project?
> Note : We are keen to develop embedded linux with navit (Navigation 
> software
> ).
>

There are good documentation and tutorials

e.g.

https://www.yoctoproject.org/documentation
https://www.yoctoproject.org/tools-resources/videos
https://www.yoctoproject.org/tools-resources/training
https://www.yoctoproject.org/tools-resources/presentations

> Regards,
> Winiston.P
> Futura Automation Pvt Ltd.
>
> Ph :91-80-28375290 / 28375295
> Fax :91-80-28375291
>
>
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 


