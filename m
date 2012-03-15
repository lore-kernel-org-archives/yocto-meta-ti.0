Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C3D93E00596
	for <meta-ti@yoctoproject.org>; Thu, 15 Mar 2012 10:47:50 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M0X004ZDTFAEA61@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 15 Mar 2012 12:47:35 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5E914201AC; Thu,
	15 Mar 2012 13:47:33 -0400 (EDT)
Date: Thu, 15 Mar 2012 13:47:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Enrico <ebutera@users.berlios.de>
Message-id: <20120315174733.GD30363@denix.org>
References: <1331544485-5050-1-git-send-email-schnitzeltony@googlemail.com>
	<CA+2YH7tFcGQiu_1ND0XNiDeJPwTKnzyfUa5Z0_1xY0R9kBsXGQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CA+2YH7tFcGQiu_1ND0XNiDeJPwTKnzyfUa5Z0_1xY0R9kBsXGQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-eula-unpack: throw error message in case 32bit-glibc is missing
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
X-List-Received-Date: Thu, 15 Mar 2012 17:47:50 -0000
Content-type: text/plain; charset=iso-8859-1
Content-disposition: inline
Content-transfer-encoding: 8bit

On Thu, Mar 15, 2012 at 06:35:59PM +0100, Enrico wrote:
> On Mon, Mar 12, 2012 at 10:28 AM, Andreas M?ller
> <schnitzeltony@googlemail.com> wrote:
> > TI installation tool requires 32bit glibc [1]
> >
> > [1] https://lists.yoctoproject.org/pipermail/meta-ti/2012-January/000357.html
> >
> > Signed-off-by: Andreas M?ller <schnitzeltony@googlemail.com>
> > ---
> >  recipes-ti/includes/ti-eula-unpack.inc |    8 ++++++++
> >  1 files changed, 8 insertions(+), 0 deletions(-)
> 
> I think it causes this error on a 32bit kubuntu 11.10:
> 
> NOTE: package ti-xdctools-3_23_00_32-r0: task do_unpack: Started
> ERROR: Function failed:
> TI installer requires 32bit glibc libraries for proper operation
>         run 'yum install glibc.i686' on Fedora or 'apt-get install
> ia32-libs' on Ubuntu/Debian
> ERROR: Logfile of failure stored in: /stuff/setup-scripts-new/.....
> Log data follows:
> | NOTE: Unpacking /stuff/setup-scripts-new/....
> | NOTE: Unpacking /stuff/setup-scripts-new/...
> | ERROR: Function failed:
> | TI installer requires 32bit glibc libraries for proper operation
> |       run 'yum install glibc.i686' on Fedora or 'apt-get install
> ia32-libs' on Ubuntu/Debian
> NOTE: package ti-xdctools-3_23_00_32-r0: task do_unpack: Failed
> ERROR: Task 3587
> (/stuff/setup-scripts-new/sources/meta-ti/recipes-ti/devtools/ti-xdctools_3.23.00.32.bb,
> do_unpack) failed with exit code '1'
> 
> Maybe the problem is that in my system libc is:
> 
> /lib/i386-linux-gnu/libc.so.6 -> libc-2.13.so

That's multiarch... I was afraid of that when commiting the change - it's no 
longer as easy to check for 32/64 bit libc as to just look at /lib32 or 
/lib64... And looks like more and more distros are moving towards multiarch, 
unfortunately it's not yet well standardized and there are some differences in 
the implementation. Wookey had a nice presentation at the last ELC about 
multiarch in Debian...

http://elinux.org/images/d/d8/Multiarch_and_Why_You_Should_Care-_Running%2C_Installing_and_Crossbuilding_With_Multiple_Architectures.pdf

> I know 32bit host is not officially supported (if i remember
> correctly) but since the problem is only there it would be nice to
> keep it working.

-- 
Denys

