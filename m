Return-Path: <aymericdumaz@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9935FE00B36; Fri, 18 Dec 2015 18:10:14 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (aymeric.dumaz[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.217.181 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5C269E00406
	for <meta-ti@yoctoproject.org>; Fri, 18 Dec 2015 18:10:09 -0800 (PST)
Received: by mail-lb0-f181.google.com with SMTP id pv2so4629899lbb.1
	for <meta-ti@yoctoproject.org>; Fri, 18 Dec 2015 18:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=81JHdSYocQbKLCJnD4VfFBpC68BX+l+LqE/rq8UABPE=;
	b=0D8FjzGFIiG7cyKCEpg1hOKAuQg5thkhNWMTPp9iiJ43Go9AVWTkjz81k9nxbt69pV
	G1KURciH1h8O+TKJCwTrHGLuAqV6A81xWfTxgPRTSzcUlBRqQdcAzRL4QDAl01yEEPLe
	D5DpLDAqkFyWIsZWY1eVfp7jyuYB9aptzqxxwtkzkdJWpDtem0VwCK70BLWUe7r29eQ3
	PqXfCXPGs3JXFfGMdHtnkHVhQnzBnCEsxLwvKOjE0p0yLBf3o+DfhqcPYZ5yWmK6ykh6
	n84sCNbXIxxrA2o0Y3FumGzhq73GYShTL1WEc/8ad2mmSPQNSRrz/xBAc8AIHlBlOVrV
	Gl4A==
MIME-Version: 1.0
X-Received: by 10.112.204.100 with SMTP id kx4mr2094270lbc.32.1450491008127;
	Fri, 18 Dec 2015 18:10:08 -0800 (PST)
Sender: aymericdumaz@gmail.com
Received: by 10.25.213.209 with HTTP; Fri, 18 Dec 2015 18:10:08 -0800 (PST)
In-Reply-To: <20151218210044.GW27464@edge>
References: <CAESSzZwLDR3AkL=f8n5J6Qs2B4wmy66S3HA58Sbuz2qPvxYp8Q@mail.gmail.com>
	<20151218210044.GW27464@edge>
Date: Fri, 18 Dec 2015 18:10:08 -0800
X-Google-Sender-Auth: XCKlb-3zlJWKhHdoe_5GOcYjN0M
Message-ID: <CAESSzZxOp96Ojxrx5_k0xZFwmuKh55jCGWsPdFL1FxONeL75TA@mail.gmail.com>
From: Aymeric Dumaz <aymeric.dumaz@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
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
X-List-Received-Date: Sat, 19 Dec 2015 02:10:14 -0000
Content-Type: text/plain; charset=UTF-8

2015-12-18 13:00 GMT-08:00 Denys Dmytriyenko <denys@ti.com>:
> On Thu, Dec 17, 2015 at 05:19:39PM -0800, Aymeric Dumaz wrote:
>> Hello,
>>
>> I tried to build a Fido core-image-minimal for the OMAP5 EVM and BB X15.
>>
>> On the OMAP5432 uEVM, nothing happens after "Starting kernel", there
>> is no log and the HDMI screen doesn't show the Arago prompt.
>> Adding the earlyprintk option doesn't change anything, but the board
>> was booting correctly with a Daisy image.
>
> Can you provide more details about OMAP5 EVM boot issue? I just checked my
> logs and it seems to boot fine with current 4.1.13 kernel from Fido branch up
> until when it tries to mount root over NFS (the defconfig doesn't have USB
> built-in and this board has Ethernet over USB).

So my board booting issue was because of a bad u-boot environment
saved on the MMC.

But I was not able to get the HDMI working. During the boot process, I
can see multiple times "connector-hdmi connector@0: failed to find
video source".
"modprobe omapdrm_pvr" works (I can see it with lsusb), but pvrsrvinit fails:

PVR:(Error): OpenServices: drmOpen failed [120, /pvr_bridge_u.c]
PVR:(Error): PVRSRVInitSrvConnect: PVRSRVConnect failed [2572,
/bridged_pvr_glue.c]
PVR:(Error): SrvInit: PVRSRVInitSrvConnect failed (4) [37, /srvinit.c]
PVR:(Error): main: SrvInit failed (4) [47, /pvrsrvinit.c]

By the way, it's a revision UEVM5432G-02-12-00; I also notice a
strange behaviour with the UART, the refresh only occurs every two
characters.

Regards,

>
> --
> Denys

