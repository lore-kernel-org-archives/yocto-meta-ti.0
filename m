Return-Path: <russell@personaltelco.net>
Received: from mail.tdb.com (mail.tdb.com [216.99.214.4])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 09D1BE013E8
	for <meta-ti@yoctoproject.org>; Mon,  9 Apr 2012 03:12:24 -0700 (PDT)
Received: (qmail 15422 invoked from network); 9 Apr 2012 03:12:24 -0700
Received: from unknown (HELO coulee.tdb.com) (216.99.214.7)
	by mail.tdb.com with SMTP; 9 Apr 2012 03:12:24 -0700
Received: (qmail 8987 invoked by uid 1001); 9 Apr 2012 10:12:24 -0000
To: Koen Kooi <koen@dominion.thruhere.net>
References: <86pqbmm4oe.fsf@coulee.tdb.com> <20120405191501.GB5144@denix.org>
	<86bon5nc3h.fsf@coulee.tdb.com> <86zkapljsw.fsf@coulee.tdb.com>
	<20120409014021.GD10246@denix.org> <868vi5gutt.fsf_-_@coulee.tdb.com>
	<32E2D6B5-FF5A-4FE9-81A3-DDAC31318CC9@dominion.thruhere.net>
From: Russell Senior <russell@personaltelco.net>
Date: Mon, 09 Apr 2012 03:12:24 -0700
In-Reply-To: <32E2D6B5-FF5A-4FE9-81A3-DDAC31318CC9@dominion.thruhere.net>
	(Koen Kooi's message of "Mon\, 9 Apr 2012 11\:08\:06 +0200")
Message-ID: <86398dgqnr.fsf@coulee.tdb.com>
User-Agent: Gnus/5.101 (Gnus v5.10.10) Emacs/21.4 (gnu/linux)
MIME-Version: 1.0
Cc: meta-ti@yoctoproject.org, angstrom-distro-devel@linuxtogo.org
Subject: Re: [PATCH] apply recommended kernel config for beaglebone
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Apr 2012 10:12:25 -0000
Content-Type: text/plain; charset=us-ascii

>>>>> "Koen" == Koen Kooi <koen@dominion.thruhere.net> writes:

Koen> Apart from the missing PR bump, the changes have no effect on
Koen> systemd, c/fuse can be a module and cgroup debugging isn't
Koen> needed.

Sorry for my sloppy patching.  

With that patch applied, I managed to actually boot my own
kernel/rootfs for the first time in a month of trying.  The inital
boot looked the same, with the [ FAIL ]'s and udevd messages, but when
I went to capture the console in a screen.log and reset (using the
reset button near the LEDs), amazingly on the second boot it came up
cleanly to a login prompt.  I know that in all previous cases I had
reset like that before, the second (and subsequent) boots had remained
failing.


-- 
Russell Senior, President
russell@personaltelco.net

