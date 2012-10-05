Return-Path: <evadeflow@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DFF1BE012F0
	for <meta-ti@yoctoproject.org>; Fri,  5 Oct 2012 09:08:59 -0700 (PDT)
Received: by mail-ob0-f176.google.com with SMTP id x4so2368401obh.35
	for <meta-ti@yoctoproject.org>; Fri, 05 Oct 2012 09:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=3QS/YdDt1oysRIfhNIAegyiD0Qjg0wXQ1oJ2G1Tj0hY=;
	b=BWgiJeIw4g7T6pzZWyQ0xr1DYTGKFN7JMKRE+EBPfw6N3uYlws4xJL/qw1GOHvwp7r
	b4s+dt8yZe7Gru+rV7b94OPVkO8yDKPCsFayM7qY23zIY5+FMIhYm4aq5wRGv7kKh0Bx
	USuwX0mCwvqYyOqeWPScPbdcQAZoG1mz+y++cEa8XC0USB7AkFC8GJA+ZaXFsSbJL1SB
	LTjO9rnPPdBbR4l/mJfihPXEywq7uWWQcLuFl2TnlPcq/9uqyDr0HZGPCLf3yO8I6MaX
	T+E7cPk6Pd93clvRdy/65MoCSIGhN/vW9BLkfKgwXnimEsikgu66RDohO1RZ90vnGZ/K
	Ynxg==
MIME-Version: 1.0
Received: by 10.60.172.236 with SMTP id bf12mr7434298oec.23.1349453337030;
	Fri, 05 Oct 2012 09:08:57 -0700 (PDT)
Received: by 10.76.167.165 with HTTP; Fri, 5 Oct 2012 09:08:57 -0700 (PDT)
Date: Fri, 5 Oct 2012 12:08:57 -0400
Message-ID: <CAMAb8ZMnmyohZ=_KjjJPjOwtNo78GkONLDz7oq+9qk2HZ_FFww@mail.gmail.com>
From: Evade Flow <evadeflow@gmail.com>
To: meta-ti@yoctoproject.org
Subject: Pandaboard ES boots but display not working
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
X-List-Received-Date: Fri, 05 Oct 2012 16:09:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

I know Pandaboard support in meta-ti is completely unofficial, but I
have one (ES, rev B1) to play around with, so I've been trying to get
Yocto's core-image-sato to run on mine, following the directions in this
blog post:

  - http://maniacbug.wordpress.com/2012/08/03/pandayocto/

My build configuration looks like this:

OE Build Configuration:
BB_VERSION        = "1.15.2"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "pandaboard"
DISTRO            = "poky"
DISTRO_VERSION    = "1.2.1"
TUNE_FEATURES     = "armv7a vfp neon cortexa9"
TARGET_FPU        = "vfp-neon"
meta
meta-yocto        = "denzil:f6b83ac65be48a31510cda0df423f53d0f477046"
meta-ti           = "(nobranch):30fb40ebc13614a74c2e237927c60ac43e01d1bc"

It boots to a prompt in the serial console, but the display attached to
the DVI port never comes up.  I see a bunch of these errors fly by in
the console:

[606810.212] (==) FBDEV(0): Backing store disabled
[606810.213] (EE) FBDEV(0): FBIOPUTCMAP: Invalid argument
[606810.213] (EE) FBDEV(0): FBIOPUTCMAP: Invalid argument
[606810.213] (EE) FBDEV(0): FBIOPUTCMAP: Invalid argument
[606810.213] (EE) FBDEV(0): FBIOPUTCMAP: Invalid argument
[606810.213] (EE) FBDEV(0): FBIOPUTCMAP: Invalid argument
[606810.213] (EE) FBDEV(0): FBIOPUTCMAP: Invalid argument
...

Complete Xorg.log is at http://pastebin.com/ry6m67Jw, in case it
helps. The dmesg output is at http://pastebin.com/az0b4itb.

I would *love* to see some graphics on this thing. Any advice about how
to troubleshoot this?

