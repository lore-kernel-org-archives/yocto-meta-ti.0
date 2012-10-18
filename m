Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C7E43E003D6
	for <meta-ti@yoctoproject.org>; Thu, 18 Oct 2012 13:34:43 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MC3005AJVT2IW60@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 18 Oct 2012 15:34:25 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 25AD6200BF; Thu,
	18 Oct 2012 16:34:13 -0400 (EDT)
Date: Thu, 18 Oct 2012 16:34:13 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Tim Bird <tim.bird@am.sony.com>
Message-id: <20121018203413.GA25196@denix.org>
References: <508064FA.5050701@am.sony.com>
MIME-version: 1.0
In-reply-to: <508064FA.5050701@am.sony.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Dependency on packagegroup??
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
X-List-Received-Date: Thu, 18 Oct 2012 20:34:43 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Oct 18, 2012 at 01:22:18PM -0700, Tim Bird wrote:
> I'm just getting started using the meta-ti layer, and
> on my first build for a MACHINE="pandaboard", I got this error:
> 
> $ bitbake core-image-minimal
> ERROR: ParseError at /a/home/tbird/work/yocto/meta-ti/recipes-ti/packagegroup/packagegroup-ti-test.bb:5: Could not inherit file classes/packagegroup.bbclass
> ERROR: Command execution failed: Exited with 1
> 
> Summary: There was 1 WARNING message shown.
> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
> 
> I have my BBMASK set to "meta-ti/recipes-misc"
> 
> The README says that the layer depends on
> git://git.openembedded.org/openembedded-core
> 
> In looking at the dependency on packagegroups, it looks like this is only referenced in
> meta-ti/recipes-ti/packagegroup/packagegroup-ti-test.bb
> 
> If I'm not interested (currently) in the test packages, can I just remove or
> rename packagegroup-ti-test.bb, or add it to BBMASK,
> rather than install the openembedded-core layer?
> 
> Will this break anything?
> 
> I'd like to keep my setup as minimal as possible.

Hi, Tim,

I think you are mixing branches and versions here. As "packagegroup" is what 
"task" has been renamed to in the latest OE-Core (Yocto/Poky whichever you 
use) - that's in the master branch. Looks like you are using either a 
"denzil" branch of OE-Core or a previous release of Yocto/Poky and mixing it 
with the "master" branch of meta-ti. If "denzil" is what you need, please use 
the corresponding branch in meta-ti, as "master" of meta-ti follows the same 
in OE-Core.

-- 
Denys

