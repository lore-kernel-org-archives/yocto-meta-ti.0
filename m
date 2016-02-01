Return-Path: <winiston@futuraautomation.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DEDCBE00C13; Mon,  1 Feb 2016 04:02:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_LOW,
	STOX_REPLY_TYPE autolearn=ham version=3.3.1
X-Spam-HAM-Report: *  0.4 STOX_REPLY_TYPE STOX_REPLY_TYPE
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.44 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A82E7E00C0B
	for <meta-ti@yoctoproject.org>; Mon,  1 Feb 2016 04:02:14 -0800 (PST)
Received: by mail-pa0-f44.google.com with SMTP id cy9so81332153pac.0
	for <meta-ti@yoctoproject.org>; Mon, 01 Feb 2016 04:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=futuraautomation-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:from:to:cc:references:in-reply-to:subject:date
	:mime-version:content-type:content-transfer-encoding:importance;
	bh=Cc6+rVNQo3OIh86juH29n8+6K6HO902tz5AO9hX0yUU=;
	b=Q1RuKq2O8nuFv5hkTkDebjs55vUtygEFMR+mI1JUFjxU3FaI6Ei2kvLKNizVP69Q30
	MRrUcOtgX/xtrUoJkvQUTZ0Y0bRxtdB0TjOagrYOR0fFh1UscBNd6WvPDiqxfcDaHvjz
	z82Iklq3T2zXWkcxloCAPF0GNIWmz6JUdnUIa14K5spPbq+OAGkt9ibwayKfhPR2ZW7Y
	TRuW/meMjnqxNmYUlEqHHEpeTEFLzA5KjRt6d5k2pHfN0ydSGdfawBaKS6nYvol7B2Ct
	0b3Q64wm5Yw/12bbSAh89APuOcTNSFDbkL+0g/dvgdY3b8XjoshTPOe0SFVbrzx3+Mv4
	k3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:to:cc:references:in-reply-to
	:subject:date:mime-version:content-type:content-transfer-encoding
	:importance;
	bh=Cc6+rVNQo3OIh86juH29n8+6K6HO902tz5AO9hX0yUU=;
	b=M8fWufNIvRhdHp+IpnfIUPnx3Yo6TMHP5uF2yCL34yIrN2BN0eiM0ZbCDp3MCF5qmy
	I1BI880LK49oKJdy2AJnH4ATdtgyzMD44yV9vA1GDNY50JFgUfSbcgYvK2/Ydz/bkaf4
	DyKxjhW9+geL9MxzcX8Yy7l0+/kPEF26ruvnAkMNlXabPk0cHAX8I1RA3vkWlXey91sz
	YFU0pPG7Gy9fWivo2Y4Lc/E7tGkMG31YFFBXik4GEiY2We/l9v5pPsRk3UV7aTZGdewl
	ThhdllyADE5/Py4w3TKlGabMFVMN6zwjq5HqQgoHV/QyElh7XQluuEq6U7UV12p2aEOl
	dTzA==
X-Gm-Message-State: AG10YOTv3KeQ9qRakRhsWPu5sRBu+xzRQU8JftS6i9fBqhZQFVFPI5A4FnYtm9XPzcTpPw==
X-Received: by 10.66.164.196 with SMTP id ys4mr37336807pab.119.1454328134267; 
	Mon, 01 Feb 2016 04:02:14 -0800 (PST)
Received: from RD3 ([59.99.236.185])
	by smtp.gmail.com with ESMTPSA id e1sm42846889pas.1.2016.02.01.04.02.11
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 01 Feb 2016 04:02:12 -0800 (PST)
Message-ID: <0A62DD68742E4A579C4F0ABA4650B8F9@RD3>
From: <winiston@futuraautomation.com>
To: "Khem Raj" <raj.khem@gmail.com>
References: <F3717D3DA0F34B72A567796CC4DFB882@RD3>
	<CAMKF1sop2mXSyhr3Mu3LaLQuc-X=qiUGHnyNkyyb48SHO9+0rg@mail.gmail.com>
In-Reply-To: <CAMKF1sop2mXSyhr3Mu3LaLQuc-X=qiUGHnyNkyyb48SHO9+0rg@mail.gmail.com>
Date: Mon, 1 Feb 2016 17:36:24 +0530
MIME-Version: 1.0
X-Priority: 1
X-MSMail-Priority: High
Importance: High
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Cc: yocto texas <meta-ti@yoctoproject.org>
Subject: Re: Problem to write core-image-minimal of AM437x-evm on SD card
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
X-List-Received-Date: Mon, 01 Feb 2016 12:02:18 -0000
Content-Type: text/plain; format=flowed; charset="UTF-8"; reply-type=original
Content-Transfer-Encoding: 7bit

Dear,

Sorry...I am new to yocto project.I could not get "wic". How do I setup wic 
and "dd" it into sd card. I did not get angstrom script also. where can I 
get angstrom script ?  can you give the detailed procedure? Is there any 
related documentation available in yocto website?
Now I used "fdisk" command to format sdcard. I am able to copy MLO & 
u-image.img to BOOT partition. I extracted rootfs to secondary partition 
using"Ark" software.  But in the secondary partition, the files are not 
visible. In properties window, it shows the number of files and size of the 
files. I used that sd card to boot my am437x evm kit. It is not booting. 
What could be the error? Kindly give me the detailed procedure to copy the 
image. What are the files I need to copy for core-image-minimal kernel?
Note: I am using core-image-minimal

Regards,
Winiston.P
Futura Automation Pvt Ltd.

Ph :91-80-28375290 / 28375295
Fax :91-80-28375291
-----Original Message----- 
From: Khem Raj
Sent: Monday, February 01, 2016 10:52 AM
To: winiston@futuraautomation.com
Cc: yocto texas
Subject: Re: [meta-ti] Problem to write core-image-minimal of AM437x-evm on 
SD card

On Sun, Jan 31, 2016 at 8:19 PM,  <winiston@futuraautomation.com> wrote:
> Dear,
>
> I have successfully built core-minimal image of AM437x-evm using poky. The
> following files have been created under /tmp/deploy/images/am437x-evm
> directory.
>
> core-image-minimal-am437x-evm.tar.bz2
> core-image-minimal-am437x-evm.tar.gz
> core-image-minimal-am437x-evm-20160127052452.rootfs.tar.gz
> MLO
> MLO-am437x-evm
> u-boot.img
> u-boot-am437x-evm.img
> zImage
> zImage--4.1.15+git0+b7b07f10f6-r3f-am43x-epos-evm-20160127052452.dtb
>
> and many more files have been created. I wanted to write it on the sd 
> card.
> How do I copy the images to sd card? I did not find any command to write 
> the
> image. Kindly help me out to write the image on sd card. I could not go
> further to develop my project. I would be very thankful if you give me
> detail procedure to solve this issue.

you can use wic to generate sdcard image and then dd it into SD card
secondly you can use angstrom sdcard scripts to create your SD card 
partitions
and then copy MLO, uboot to boot partition and untar rootfs into
second partion manually

>
> Awaiting your valuable reply. Thanking you.
>
>
> Regards,
> Winiston.P
> Futura Automation Pvt Ltd.
>
> Ph :91-80-28375290 / 28375295
> Fax :91-80-28375291
>
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 


