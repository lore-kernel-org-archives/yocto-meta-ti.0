Return-Path: <robertcnelson@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C146CE00869; Thu, 17 Dec 2015 17:54:52 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (robertcnelson[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.176 listed in list.dnswl.org]
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9ED38E00349
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2015 17:54:49 -0800 (PST)
Received: by mail-io0-f176.google.com with SMTP id e126so75186178ioa.1
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2015 17:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=OombhjMy/ETgYZFWDZqY0w9+d1eFjKsV9W1Rw8doVS4=;
	b=MkuCdZmpKfbPlPaFWOzT7kS1HtwCGYaGfFS0WlQnmJF4s0BryhdV7KgAgWl1QXKVD1
	ZzB2ozed0O3rpx2dIxv7pTvMl4rYxbH+3+RMOZMeHnqCHd2EHS8gIsHCydB8HsBEcUjY
	9GUHjKBk88FU0F9IhdSkjjrhjB6PtJv8rGeIo5s28I+/fJqFp6jPObyR9ytGlru/agDS
	tMLAAUN0sXxeMSIb0N5m5tTh19XjFUsdW5DrR5+ot8/GIBE9HR70uyWUhgv+OLJgOsVs
	CclTyRU86p5rsIBQSjGAZJFBb5H1Hlc2FBeiAhiF+JQAzJybq1HutRxan+4ptc4nAIp+
	syGQ==
X-Received: by 10.107.130.82 with SMTP id e79mr2000675iod.77.1450403688845;
	Thu, 17 Dec 2015 17:54:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.29.80 with HTTP; Thu, 17 Dec 2015 17:54:19 -0800 (PST)
In-Reply-To: <CAESSzZwLDR3AkL=f8n5J6Qs2B4wmy66S3HA58Sbuz2qPvxYp8Q@mail.gmail.com>
References: <CAESSzZwLDR3AkL=f8n5J6Qs2B4wmy66S3HA58Sbuz2qPvxYp8Q@mail.gmail.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Thu, 17 Dec 2015 19:54:19 -0600
Message-ID: <CAOCHtYh_874a6fL5=Ln1CBxuxCQOA8DMpJ9FwcXb5_Oo=E2PSg@mail.gmail.com>
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
X-List-Received-Date: Fri, 18 Dec 2015 01:54:52 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 17, 2015 at 7:19 PM, Aymeric Dumaz <aymeric.dumaz@gmail.com> wrote:
> Hello,
>
> I tried to build a Fido core-image-minimal for the OMAP5 EVM and BB X15.
>
> On the OMAP5432 uEVM, nothing happens after "Starting kernel", there
> is no log and the HDMI screen doesn't show the Arago prompt.
> Adding the earlyprintk option doesn't change anything, but the board
> was booting correctly with a Daisy image.
>
> On the Beagleboard X15, I see some errors regarding the HDMI during
> the boot process; "modprobe omapdrm_pvr" works but "pvrsrvinit"
> doesn't.
> There are also errors about firmwares not loaded (dra7-ipu1-fw.xem4,
> dra7-dsp1-fw.xe66), I presume they come from the ipumm-fw recipe but
> I'm not sure if it is related.
> Also, my board is a rev. A1a, I had to patch u-boot to get the UART,
> so I won't be surprised if my board is not supported anymore.
> Here is the log: http://pastebin.com/E6WyA64P

The A1a is not supported anymore, that's why HDMI doesn't work (ldo
was moved due to power demand..).  Talk to who ever gave you the board
and get an A2..

Regards,

-- 
Robert Nelson
https://rcn-ee.com/

