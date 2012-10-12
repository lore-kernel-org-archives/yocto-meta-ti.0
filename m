Return-Path: <ml@communistcode.co.uk>
Received: from eumx.net (eumx.net [91.82.101.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30703E01468
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 03:23:00 -0700 (PDT)
Received: from localhost ([127.0.0.1]:56078 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TMcOD-0004SN-3f
	for meta-ti@yoctoproject.org; Fri, 12 Oct 2012 10:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=nxuKS6PLv/0hPKkZbYSQdYkda5o=; b=PYfsxWyeohy79gfBACPWHZAfFqzb
	OZbQx7aBx/hTdeavs2R0LDEbiCgkmdmtTYp9q54VjchJPk6Wrd9NPWwYzaLdoqt1
	qmn2frISqNVTAdgsryNSfUJwnygJwjRYUnrCrh1yHDRzO8OAYeNQKekP7/44gnEm
	Q91vMN4WdQqDqfc=
Received: from [195.171.99.130] (port=42314 helo=[192.168.0.79])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TMcOC-0004SH-V2
	for meta-ti@yoctoproject.org; Fri, 12 Oct 2012 10:22:45 +0000
Message-ID: <5077EFE3.7000603@communistcode.co.uk>
Date: Fri, 12 Oct 2012 11:24:35 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120910 Thunderbird/15.0.1
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <CA+T6QPnq1dZOJ-D+C-FFodCBjxN5AOE_qC3dFj_Vtz86rdk0bg@mail.gmail.com>
In-Reply-To: <CA+T6QPnq1dZOJ-D+C-FFodCBjxN5AOE_qC3dFj_Vtz86rdk0bg@mail.gmail.com>
Subject: Re: Introducing meta-beagleboard
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Oct 2012 10:23:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/12 16:46, Jason Kridner wrote:
> To help foster fast development, future releases of the Angstrom
> Distribution that ships with BeagleBoard.org platforms (such as
> BeagleBone and BeagleBoard-xM) will be built using meta-beagleboard,
> rather than meta-ti. While this produces the seemingly undesirable
> effect of providing yet-another-BSP for BeagleBoard.org platforms,
> collaboration in the mainline kernel and bootloaders that are the key
> elements for the BSPs has made this possible and multiple goals for
> the various BSPs has made it desirable.
>
> The objectives for meta-beagleboard are:
> 1) Provide the best possible out-of-box-experience for BeagleBoard.org platforms
> 2) Enable as much add-on hardware as possible
> 3) Enable public contributions to extend the experience and hardware support
> 4) Deliver information to the BeagleBoard.org community regarding the
> development status
>
> The repository will be hosted at:
> https://github.com/beagleboard/meta-beagleboard

Great news! Will the kernel in this BSP be attempting to follow mainline 
+ public patches? I'm chomping at the bit for an easy way to build a 
tested DT kernel with recent patches.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--


