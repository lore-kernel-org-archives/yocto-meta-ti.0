Return-Path: <robertcnelson@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 71EE8E00BBF; Sat, 19 Dec 2015 14:05:44 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (robertcnelson[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.182 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ADADDE007C3
	for <meta-ti@yoctoproject.org>; Sat, 19 Dec 2015 14:05:43 -0800 (PST)
Received: by mail-io0-f182.google.com with SMTP id q126so122896301iof.2
	for <meta-ti@yoctoproject.org>; Sat, 19 Dec 2015 14:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=tg9ZmN+9v7tO+e6z4PpN4Qjo68K8LpRawZBJPFA9Gp8=;
	b=YoP7/FupF6SgP+mmQObH94K6t0yGYwGuEM2KBTsB419XvWMVRXrPTkUgaVU3DY5HDl
	8+H+UQ5ngJioUJ2k8DLZkwegqGDTuTGCnrhWNCtBBHpHPLyIXWQV/Zw1x5eSpc5loByu
	BXtzCgHEpgadZHXV1eLPeWMhLPLOuAA+yPFd5BISHgfE80fJdmIHfrNETvOolVcJHNqE
	4gMAgVQox7KCVmdTrnWGM2DhV5/6kdHkvGwuymaP+YpG4YHWuOxU1PO0JEQ8+m4FxjzL
	jlF64YMeSumUm9XzCuDLd0LGQ+2sw0rK1GsyRkIUmAyxp8mg3xe1EzIVV4IAmov9pri1
	Tk7A==
X-Received: by 10.107.32.209 with SMTP id g200mr11213073iog.39.1450562742828; 
	Sat, 19 Dec 2015 14:05:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.29.80 with HTTP; Sat, 19 Dec 2015 14:05:13 -0800 (PST)
In-Reply-To: <CAESSzZxOp96Ojxrx5_k0xZFwmuKh55jCGWsPdFL1FxONeL75TA@mail.gmail.com>
References: <CAESSzZwLDR3AkL=f8n5J6Qs2B4wmy66S3HA58Sbuz2qPvxYp8Q@mail.gmail.com>
	<20151218210044.GW27464@edge>
	<CAESSzZxOp96Ojxrx5_k0xZFwmuKh55jCGWsPdFL1FxONeL75TA@mail.gmail.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Sat, 19 Dec 2015 16:05:13 -0600
Message-ID: <CAOCHtYjQw=2wjoGJD584jo0qTU+OQzU3acBvwnBPZvc18s+GFw@mail.gmail.com>
To: Aymeric Dumaz <aymeric.dumaz@gmail.com>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: Fido doesn't boot on OMAP5 EVM, and HDMI errors for BB X15
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
X-List-Received-Date: Sat, 19 Dec 2015 22:05:44 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 18, 2015 at 8:10 PM, Aymeric Dumaz <aymeric.dumaz@gmail.com> wrote:
> 2015-12-18 13:00 GMT-08:00 Denys Dmytriyenko <denys@ti.com>:
>> On Thu, Dec 17, 2015 at 05:19:39PM -0800, Aymeric Dumaz wrote:
>>> Hello,
>>>
>>> I tried to build a Fido core-image-minimal for the OMAP5 EVM and BB X15.
>>>
>>> On the OMAP5432 uEVM, nothing happens after "Starting kernel", there
>>> is no log and the HDMI screen doesn't show the Arago prompt.
>>> Adding the earlyprintk option doesn't change anything, but the board
>>> was booting correctly with a Daisy image.
>>
>> Can you provide more details about OMAP5 EVM boot issue? I just checked my
>> logs and it seems to boot fine with current 4.1.13 kernel from Fido branch up
>> until when it tries to mount root over NFS (the defconfig doesn't have USB
>> built-in and this board has Ethernet over USB).
>
> So my board booting issue was because of a bad u-boot environment
> saved on the MMC.
>
> But I was not able to get the HDMI working. During the boot process, I
> can see multiple times "connector-hdmi connector@0: failed to find
> video source".
> "modprobe omapdrm_pvr" works (I can see it with lsusb), but pvrsrvinit fails:
>
> PVR:(Error): OpenServices: drmOpen failed [120, /pvr_bridge_u.c]
> PVR:(Error): PVRSRVInitSrvConnect: PVRSRVConnect failed [2572,
> /bridged_pvr_glue.c]
> PVR:(Error): SrvInit: PVRSRVInitSrvConnect failed (4) [37, /srvinit.c]
> PVR:(Error): main: SrvInit failed (4) [47, /pvrsrvinit.c]

Yeah, we see this on the x15 on debian, (same ti kernel, same ti sgx libs)..

Haven't figured out the "magic" ti setup on the am57xx sdk release

https://groups.google.com/d/msg/beagleboard-x15/ttd_K8IdKlw/StWTHfcPCAAJ

Regards,

-- 
Robert Nelson
https://rcn-ee.com/

