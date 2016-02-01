Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 230D5E0079A; Mon,  1 Feb 2016 09:07:02 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (raj.khem[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8881CE00444
	for <meta-ti@yoctoproject.org>; Mon,  1 Feb 2016 09:06:55 -0800 (PST)
Received: by mail-io0-f178.google.com with SMTP id 9so85568536iom.1
	for <meta-ti@yoctoproject.org>; Mon, 01 Feb 2016 09:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=vWVJ4rsa+6nYQsn8EOLosjaSPHpKiQZlkaxdkmDGLHQ=;
	b=qQjaBlfPDtCyeRPu0Rr5taWlDPi/zoXYMtrDjYpxbmYiqzfIi5pNAxI+r0D8iXdUZx
	nGrQe6Wc4EDVmg3rPNtMEAXyVzsBrzjRjukuN+1t65+9PqXTHj3CuBt6zDHqv1Ret0JC
	QAMFAa/EofzGXEU9eajLWaJ31O11a7w2PsnlwnXojgPhhvtBfDLerXsia3piCenT2xRv
	AGQnlLZSH6mhR/V9ehfDpUXIzfsNrArQ3+FSHkItTOxcqGDqUJEaGWtVYqbtFkOPWYvQ
	XEv2NaOtMdvrwtVDpSZtoVpxI3v3IPi3r29P0cA9mDFU3fR6fBUJ6wEhpSlbxMdOrXtw
	nngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vWVJ4rsa+6nYQsn8EOLosjaSPHpKiQZlkaxdkmDGLHQ=;
	b=W5ShoZbh3VcOtNF3RNRH5k0Pqa3QQ1F8z2rsBFGe1dkr2v+uXSM8oIgsAbjGyh/f34
	dbDUHTA+DNkUCO3d/7WIYk9PxhxUZSvw28qiViau9QY91urqgMn5sHr4rNkqOiNEWGfU
	nAEYvgALBmf0Odaeg0uwW0bqf6kRn2toJTtTlzdf4P8exK6rlxtII/sV2AnrAqc3j7M1
	7uwx72PdRlOaY4gunbeL5HN5ZyZDmcreyZUca0+bcSMneBHgMjtHba05ZdO0KONy6bfV
	jL31VkjNSUqy6hHmBDkni5KwSgiJM72jtgYsjxTJyUIb7BNdRkWRE8ZWEkfWwNdbuAer
	ywiA==
X-Gm-Message-State: AG10YORe8NJeBaPkok/yFwgrVwgKmTqPkrJdu58PJMUyMWona5xI3/NHLQwXCY5/saQmsBjgS9z8x/AF+t1tVQ==
X-Received: by 10.107.34.79 with SMTP id i76mr27858525ioi.195.1454346414649;
	Mon, 01 Feb 2016 09:06:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.46.219 with HTTP; Mon, 1 Feb 2016 09:06:25 -0800 (PST)
In-Reply-To: <0A62DD68742E4A579C4F0ABA4650B8F9@RD3>
References: <F3717D3DA0F34B72A567796CC4DFB882@RD3>
	<CAMKF1sop2mXSyhr3Mu3LaLQuc-X=qiUGHnyNkyyb48SHO9+0rg@mail.gmail.com>
	<0A62DD68742E4A579C4F0ABA4650B8F9@RD3>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Feb 2016 09:06:25 -0800
Message-ID: <CAMKF1spzW-ruiZC7UhmV2r3h7f8KA20CcgDKvvR2kqfXiRpkcw@mail.gmail.com>
To: winiston@futuraautomation.com
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
X-List-Received-Date: Mon, 01 Feb 2016 17:07:02 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 1, 2016 at 4:06 AM,  <winiston@futuraautomation.com> wrote:
> Dear,
>
> Sorry...I am new to yocto project.I could not get "wic". How do I setup wic
> and "dd" it into sd card. I did not get angstrom script also. where can I
> get angstrom script ?  can you give the detailed procedure? Is there any
> related documentation available in yocto website?

see http://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html
section 5.6

ideally take sdcard image from beagleboard.org and dd if=sdcard.image
of=/dev/sdX
which sdX is where sdcard is on your machine. this will prepare the card
along with image. Now you can mount the partitions individually and
replace the files
as you wish

> Now I used "fdisk" command to format sdcard. I am able to copy MLO &
> u-image.img to BOOT partition. I extracted rootfs to secondary partition
> using"Ark" software.  But in the secondary partition, the files are not
> visible. In properties window, it shows the number of files and size of the
> files. I used that sd card to boot my am437x evm kit. It is not booting.
> What could be the error? Kindly give me the detailed procedure to copy the
> image. What are the files I need to copy for core-image-minimal kernel?
> Note: I am using core-image-minimal
>
> Regards,
> Winiston.P
> Futura Automation Pvt Ltd.
>
> Ph :91-80-28375290 / 28375295
> Fax :91-80-28375291
> -----Original Message----- From: Khem Raj
> Sent: Monday, February 01, 2016 10:52 AM
> To: winiston@futuraautomation.com
> Cc: yocto texas
> Subject: Re: [meta-ti] Problem to write core-image-minimal of AM437x-evm on
> SD card
>
>
> On Sun, Jan 31, 2016 at 8:19 PM,  <winiston@futuraautomation.com> wrote:
>>
>> Dear,
>>
>> I have successfully built core-minimal image of AM437x-evm using poky. The
>> following files have been created under /tmp/deploy/images/am437x-evm
>> directory.
>>
>> core-image-minimal-am437x-evm.tar.bz2
>> core-image-minimal-am437x-evm.tar.gz
>> core-image-minimal-am437x-evm-20160127052452.rootfs.tar.gz
>> MLO
>> MLO-am437x-evm
>> u-boot.img
>> u-boot-am437x-evm.img
>> zImage
>> zImage--4.1.15+git0+b7b07f10f6-r3f-am43x-epos-evm-20160127052452.dtb
>>
>> and many more files have been created. I wanted to write it on the sd
>> card.
>> How do I copy the images to sd card? I did not find any command to write
>> the
>> image. Kindly help me out to write the image on sd card. I could not go
>> further to develop my project. I would be very thankful if you give me
>> detail procedure to solve this issue.
>
>
> you can use wic to generate sdcard image and then dd it into SD card
> secondly you can use angstrom sdcard scripts to create your SD card
> partitions
> and then copy MLO, uboot to boot partition and untar rootfs into
> second partion manually
>
>>
>> Awaiting your valuable reply. Thanking you.
>>
>>
>> Regards,
>> Winiston.P
>> Futura Automation Pvt Ltd.
>>
>> Ph :91-80-28375290 / 28375295
>> Fax :91-80-28375291
>>
>> --
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti
>>
>

