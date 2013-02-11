Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C84E3E0027C
	for <meta-ti@yoctoproject.org>; Mon, 11 Feb 2013 11:51:08 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MI2009SZN4E9ZG2@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 11 Feb 2013 13:50:49 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A2BC2200A9; Mon,
	11 Feb 2013 14:50:38 -0500 (EST)
Date: Mon, 11 Feb 2013 14:50:38 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jesse Dannenbring <jtdannenbring@gmail.com>
Message-id: <20130211195038.GA28742@denix.org>
References: <CACMnT39zosRxQfXXoQ8Pbwwtqa2GzKqyqWj2bgU23u4SwM_ypQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CACMnT39zosRxQfXXoQ8Pbwwtqa2GzKqyqWj2bgU23u4SwM_ypQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Error building after "mesa-dri update to 9.0.1"
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
X-List-Received-Date: Mon, 11 Feb 2013 19:51:08 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Jan 25, 2013 at 02:51:29PM -0800, Jesse Dannenbring wrote:
> Hello,
> 
> I previously was building meta-ti without issue but I repeated the process
> recently and found that the patch on 2013-01-10 broke my build:
> 
> bitbake -c fetchall core-image-minimal
> Pseudo is not present but is required, building this first before the main
> build
> Parsing recipes: 100% |#########################################| Time:
> 00:02:54
> Parsing of 891 .bb files complete (0 cached, 891 parsed). 1197 targets, 64
> skipped, 7 masked, 0 errors.
> ERROR: No recipes available for:
> 
> /home/jesse/yocto/poky-danny-8.0/meta-ti/recipes-graphics/mesa/mesa-dri_9.0.1.bbappend

Since you are using danny release of poky, please use the same danny branch of 
meta-ti. The change you refer to was made in master branch, that tracks the 
master branch of oe-core.

-- 
Denys

