Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7067DE0044D
	for <meta-ti@yoctoproject.org>; Mon,  5 Mar 2012 17:00:55 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M0F00ECGUFUV661@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 05 Mar 2012 18:52:42 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 208ED2016E; Mon,
	05 Mar 2012 19:52:41 -0500 (EST)
Date: Mon, 05 Mar 2012 19:52:41 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Message-id: <20120306005241.GF2030@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Fw: OpenEmbbedded as a test suite next steps
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
X-List-Received-Date: Tue, 06 Mar 2012 01:00:55 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

All,

Early planning stages of what's going to be a meta-linaro toolchain layer for 
OE-Core/Yocto. Interesting stuff, we should probably pitch in for some of the 
items there, that we can help with - such as selection of the platforms with 
recent kernels and possibly cloud builds... Any thoughts?

-- 
Denys


----- Forwarded message from Michael Hope <michael.hope@linaro.org> -----

Date: Tue, 6 Mar 2012 13:26:42 +1300
From: Michael Hope <michael.hope@linaro.org>
To: Ken Werner <ken.werner@linaro.org>
Cc: linaro-toolchain@lists.linaro.org
Subject: OpenEmbbedded as a test suite next steps

Hi Ken.  In follow up to our 1-on-1 yesterday, here's what I'd like done next.

The goal is to use OE Core as a release test suite.  The releases are
tarballs so we can keep the current recipe format and punt bzr support
for later.  The first step is to be able to reliably build a release
in the cloud or validation lab.

In all cases keep the other teams in mind.  Much of this is related to
Validation.  Platform will be involved later.  Ping them early.

Kernel:
We're starting with GCC and need a kernel to supply headers and to
boot some type of ARMv7 image.  I don't want a linux-linaro recipe as
people will use it and it's too early for that.

Find a kernel, preferably from OE Core, that is recent, ARMv7, >= 512
MB RAM, and works well with qemu-linaro.  Prefer vexpress-a9, else
OMAP?

Talking:
Say Hi to Validation re: EC2 and plans
Say Hi to the ARM landing team re: vexpress upstream support
Say Hi to Beth Flanagan re: Yocto's existing auto builders and any hints

Cloud builds:
Find out who is already doing OE builds in the cloud and how
Run a build locally and time
Push ~/downloads into the cloud, build, and time[1]
Figure how much this build will cost in dollars

[1] c1.xlarge might be best.  Builds are normally I/O bound and the
cloud is I/O poor.  Put /tmp and other chunks in a tmpfs?  EC2 rounds
up to the nearest hour as well.

If the cloud is too expensive then we'll get a machine installed.

S3 for storage:
(only proceed if affordable)
Use S3 for storing the input tarballs
Use S3 either as a pre-mirror by serving over HTTP, or use s3cmd to
sync down the tarballs before starting the build

Scripting:
Re-use existing scripts if feasible.  Integrate with LAVA providing we
can run exactly the same scripts on a laptop for debugging.

Script the bitbake, OE meta layer, and Linaro meta layer setup.
Script the configuration including setting the release tarball URL and
GCC preferred version.
Script the build and result capture, especially the log, any ICEs, and
the final sizes

Future:
OE can grab a repository seed then update based on that.  Check if the
bzr backend supports this.  If so, play with seeding to do tip builds.

Let me know what you think then we'll spawn blueprints.  Let's keep an
eye on this as it's sounding expensive.

-- Michael

_______________________________________________
linaro-toolchain mailing list
linaro-toolchain@lists.linaro.org
http://lists.linaro.org/mailman/listinfo/linaro-toolchain


----- End forwarded message -----

