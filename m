Return-Path: <errordeveloper@gmail.com>
Received: from mail-vc0-f175.google.com (mail-vc0-f175.google.com
	[209.85.220.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6129DE014DF
	for <meta-ti@yoctoproject.org>; Thu, 18 Apr 2013 01:22:59 -0700 (PDT)
Received: by mail-vc0-f175.google.com with SMTP id lf11so2939vcb.20
	for <meta-ti@yoctoproject.org>; Thu, 18 Apr 2013 01:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=+ToSTgO5w3kzPQirG4LybrdVfIagwhb9v8fsO0n/8II=;
	b=wt8PuhTBvRnyC7fqD+4gpshnwq7TNKJXAhvCWJgbImGCoxZKPekYvchWiBreE/jxzM
	HFK48wIawC/j//HezIAf7b+3IqyMIrWbVzLCiKLwqYMy9NosAY44bLQpn4Dfdm6wnavz
	QHyJKyXYmVkIBJ0OGHdctK5GQ20fVkUIuxp5akR7dkne/xXGREio0TC7SKRjGXbU8bko
	EKRmQCC60JZv3pyZsux7WZdefc2xs54ZPxExtFrYrE+dDvlMXP8HZMD6qH4WYcJ5xQ+C
	9IksRe3xcMXsSm2e1CPWMfPj3ggE6b4MBXV8JVYsh0XqGSFkketU6LBu/f6HYObxZtMU
	INDQ==
MIME-Version: 1.0
X-Received: by 10.220.156.75 with SMTP id v11mr7510013vcw.1.1366273378668;
	Thu, 18 Apr 2013 01:22:58 -0700 (PDT)
Received: by 10.59.7.197 with HTTP; Thu, 18 Apr 2013 01:22:58 -0700 (PDT)
Date: Thu, 18 Apr 2013 09:22:58 +0100
Message-ID: <CAPhDKbH84Nhitv+DW6Vcaza0VCjx=T_nw+KUcreico0vBsLAwA@mail.gmail.com>
From: Ilya Dmitrichenko <errordeveloper@gmail.com>
To: meta-ti@yoctoproject.org
Subject: Connection refused to git.ti.com
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
X-List-Received-Date: Thu, 18 Apr 2013 08:22:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I am getting this message:

Build Configuration:
BB_VERSION        = "1.16.0"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "beaglebone"
DISTRO            = "poky"
DISTRO_VERSION    = "1.3.1"
TUNE_FEATURES     = "armv7a vfp neon cortexa8"
TARGET_FPU        = "vfp-neon"
meta
meta-yocto
meta-yocto-bsp    = "danny:e2ef3200e61af33ec71e34fb7a67cbcdd68dc981"
meta-ti           = "danny:8f7d03e4a1e87c5b32c413f50e362280d8e6928a"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: Failed to fetch URL
git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=ti-linux-3.8.y,
attempting MIRRORS if available
ERROR: Fetcher failure: Fetch command failed with exit code 128, output:
Cloning into bare repository
'/home/ilya/beaglebone-dany/build/downloads/git2/git.ti.com.ti-linux-kernel.ti-linux-kernel.git'...

fatal: unable to connect to git.ti.com:
git.ti.com[0: 198.47.29.193]: errno=Connection refused


ERROR: Function failed: Fetcher failure for URL:
'git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=ti-linux-3.8.y'.
Unable to fetch URL from any source.
ERROR: Logfile of failure stored in:
/home/ilya/beaglebone-dany/build/tmp/work/beaglebone-poky-linux-gnueabi/linux-ti-staging-3.8.5-r0/temp/log.do_fetch.2909
ERROR: Task 669
(/home/ilya/beaglebone-dany/meta-ti/recipes-kernel/linux/linux-ti-staging_3.8.bb,
do_fetch) failed with exit code '1'
NOTE: Tasks Summary: Attempted 584 tasks of which 556 didn't need to
be rerun and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
  /home/ilya/beaglebone-dany/meta-ti/recipes-kernel/linux/linux-ti-staging_3.8.bb,
do_fetch
Summary: There was 1 WARNING message shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

In the meantime I manage to clone this repo on another machine.
Seems like a firewall issue, can anyone check?

I have retried to bitbake this multiple times over the last 12 hours
and did try to run git clone manually from the same machine:
git clone git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
Cloning into 'ti-linux-kernel'...
fatal: unable to connect to git.ti.com:
git.ti.com[0: 198.47.29.193]: errno=Connection refused

It worked from another machine however.

Another thing I have tried is cloning a repo from elsewhere using
git:// protocol and it worked. This protocol uses port 9418, so I
checked connectivity using telnet. It failed to open connection for
git.ti.com and worked fine for github.com. So port 9418 is not
firewalled on our end.

Let me whatever else you want me to test.

Cheers,
--
Ilya

