Return-Path: <aymericdumaz@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D6A8DE00B6F; Thu, 17 Dec 2015 17:19:44 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (aymeric.dumaz[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.217.174 listed in list.dnswl.org]
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 96BF5E00349
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2015 17:19:40 -0800 (PST)
Received: by mail-lb0-f174.google.com with SMTP id u9so54989479lbp.2
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2015 17:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=Heka6iWaRAra6KNew0SSQ2eIiZZmi+LrNoNGvbLSz84=;
	b=x+lVrNp1YQjDyLSK73N5vKIzBZM72M6fXX4axr5zU+spCZemMcZvXtMr1BeAtFFzyE
	b9+54dvXAMuiB1ZHBQeMUUL3DH+pe7pQ/yPFXx62c21YzNZwAROYmb6PyymnT3nqNCjK
	g58kgUHWHFvh6UIJExIVFd8NoZ6LSnACMxOP5h/Rtmhudbs3rBFjQR+Q2x+5qJ21J9NL
	iKyQR0bsPtOZPOY0weSLeY2IBT4lp4zEOjAh8mESHFWhfNPVO29SoXjJigAfBQASrlsu
	DDru5wBr3u3IN9OnjkJOkZ8KAwLuBzj1pS+IHSCMH6p7lolxMsz3HR2tjTxjuYroOYEM
	5XmQ==
MIME-Version: 1.0
X-Received: by 10.112.143.70 with SMTP id sc6mr284099lbb.15.1450401579088;
	Thu, 17 Dec 2015 17:19:39 -0800 (PST)
Sender: aymericdumaz@gmail.com
Received: by 10.25.213.209 with HTTP; Thu, 17 Dec 2015 17:19:39 -0800 (PST)
Date: Thu, 17 Dec 2015 17:19:39 -0800
X-Google-Sender-Auth: K1qkg3LODViRt5H83GoPberrjlo
Message-ID: <CAESSzZwLDR3AkL=f8n5J6Qs2B4wmy66S3HA58Sbuz2qPvxYp8Q@mail.gmail.com>
From: Aymeric Dumaz <aymeric.dumaz@gmail.com>
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Fido doesn't boot on OMAP5 EVM, and HDMI errors for BB X15
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
X-List-Received-Date: Fri, 18 Dec 2015 01:19:44 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

I tried to build a Fido core-image-minimal for the OMAP5 EVM and BB X15.

On the OMAP5432 uEVM, nothing happens after "Starting kernel", there
is no log and the HDMI screen doesn't show the Arago prompt.
Adding the earlyprintk option doesn't change anything, but the board
was booting correctly with a Daisy image.

On the Beagleboard X15, I see some errors regarding the HDMI during
the boot process; "modprobe omapdrm_pvr" works but "pvrsrvinit"
doesn't.
There are also errors about firmwares not loaded (dra7-ipu1-fw.xem4,
dra7-dsp1-fw.xe66), I presume they come from the ipumm-fw recipe but
I'm not sure if it is related.
Also, my board is a rev. A1a, I had to patch u-boot to get the UART,
so I won't be surprised if my board is not supported anymore.
Here is the log: http://pastebin.com/E6WyA64P

Regards,

-- 
Aymeric Dumaz

