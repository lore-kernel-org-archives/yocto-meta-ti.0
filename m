Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F0A3E014DD
	for <meta-ti@yoctoproject.org>; Wed, 24 Apr 2013 10:30:05 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MLR00H81SL9LZ42@vms173015.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 24 Apr 2013 12:29:49 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A3B672011D; Wed,
	24 Apr 2013 13:29:33 -0400 (EDT)
Date: Wed, 24 Apr 2013 13:29:33 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Abramenkova, Svetlana" <SAbramenkova@luxoft.com>
Message-id: <20130424172933.GA30093@denix.org>
References: <C3024233E31E8449B5487F2C1EFB9F8ECCDE@msk-mbox-04.luxoft.com>
MIME-version: 1.0
In-reply-to: <C3024233E31E8449B5487F2C1EFB9F8ECCDE@msk-mbox-04.luxoft.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Linux image for OMAP5
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
X-List-Received-Date: Wed, 24 Apr 2013 17:30:05 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Apr 24, 2013 at 05:08:42PM +0000, Abramenkova, Svetlana wrote:
> Hi,
> 
> I trying to create a Linux image for OMAP5 processor. I cloned meta-ti git 
> repository (git://git.yoctoproject.org/meta-ti) and tried follow steps from 
> http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment.

As it says on the front page, some of the Wiki pages are outdated and are for 
the Classic OpenEmbedded setup of Arago. So, Setting Up Build Environment is 
marked as outdated.

OMAP5 is only supported in the new OpenEmbedded-Core and Yocto Project setup 
of Arago (or another compatible distro). Unfortunately, not all Wiki pages 
were updated yet.

For setting things up for the new build environment, you can clone our 
oe-layersetup repository and use one of the config files provided:

$ git://arago-project.org/git/projects/oe-layersetup.git o5-build
$ cd o5-build
$ ./oe-layertool-setup.sh -f configs/distroless-meta-ti-config.txt
$ cd build
$ . conf/setenv
$ MACHINE=omap5-evm bitbake core-image-minimal

The above will only give you basic oe-core and meta-ti layers, but enough for 
a minimal OMAP5 image to build.

Feel free to try arago-danny-config.txt instead of distroless-meta-ti-config 
above - this way you will also get additional layers configured (meta-oe, 
meta-linaro, meta-arago) that follows our own Arago Project distribution 
closely.


> I made changes in setenv file for meta-ti repository(BBPATH=$OEBASE/meta-ti) 
> and in local configuration file for OMAP5 (MACHINE = "omap5-evm"). When I 
> start to build the image getting an error:

> "FATAL: Unable to parse [] (Could not include required file conf/machine/include/soc-family.inc)"
> It seems that I have not enough files.
> 
> Could you please provide help with setting up build environment?

-- 
Denys

