Return-Path: <russell@personaltelco.net>
Received: from mail.tdb.com (mail.tdb.com [216.99.214.4])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 7C1ABE0044D
	for <meta-ti@yoctoproject.org>; Sat,  7 Apr 2012 12:35:15 -0700 (PDT)
Received: (qmail 30437 invoked from network); 7 Apr 2012 12:35:14 -0700
Received: from unknown (HELO coulee.tdb.com) (216.99.214.7)
	by mail.tdb.com with SMTP; 7 Apr 2012 12:35:14 -0700
Received: (qmail 3560 invoked by uid 1001); 7 Apr 2012 19:35:14 -0000
To: Jack Mitchell <ml@communistcode.co.uk>
References: <86pqbmm4oe.fsf@coulee.tdb.com> <20120405191501.GB5144@denix.org>
	<86bon5nc3h.fsf@coulee.tdb.com>
	<4F80467D.40003@communistcode.co.uk>
From: Russell Senior <russell@personaltelco.net>
Date: Sat, 07 Apr 2012 12:35:14 -0700
In-Reply-To: <4F80467D.40003@communistcode.co.uk> (Jack Mitchell's message of
	"Sat\, 07 Apr 2012 14\:51\:57 +0100")
Message-ID: <86k41ribd9.fsf@coulee.tdb.com>
User-Agent: Gnus/5.101 (Gnus v5.10.10) Emacs/21.4 (gnu/linux)
MIME-Version: 1.0
Cc: meta-ti@yoctoproject.org
Subject: Re: building meta-ti + poky HOWTO?
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
X-List-Received-Date: Sat, 07 Apr 2012 19:35:15 -0000
Content-Type: text/plain; charset=us-ascii

>>>>> "Jack" == Jack Mitchell <ml@communistcode.co.uk> writes:

Jack> I took the time to post a brief guide[1] on how to build
Jack> Angstrom for the BeagleBone, it takes you through the steps and
Jack> also uses the separate images built rather than the big 'sd card
Jack> partition' image it has been noted you are having problems with.

Jack> I don't know if it will help in your situation but it's
Jack> something else you can inspect.

Jack> [1] http://communistcode.co.uk/blog/blogPost.php?blogPostID=2

Thanks.  Doesn't help, unfortunately.  Still get the same FAILs.  I
did learn that the modules aren't in the systemd-image rootfs, though.
That was a surprise.  Unfortunately, adding them doesn't help.

  [...]
  Starting Journal Service...
  Failed to start Journal Service                                        [FAILED]
  See 'systemctl status systemd-journald.service' for details.
  Started udev Coldplug all Devices                                      [  OK  ]
  Started File System Check on Root Device                               [  OK  ]
  Starting Remount Root FS...
  Failed to start Remount Root FS                                        [FAILED]
  See 'systemctl status remount-rootfs.service' for details.
  Starting /tmp...
  Starting Machine ID first boot configure...
  Starting Run pending postinsts...
  Failed to start /tmp                                                   [FAILED]
  See 'systemctl status tmp.mount' for details.
  Dependency failed. Aborted start of Serial Getty on ttyO0              [ABORT]
  Dependency failed. Aborted start of Getty on tty1                      [ABORT]
  udevd[67]: timeout, giving up waiting for workers to finish
  [...]


-- 
Russell Senior, President
russell@personaltelco.net

