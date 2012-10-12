Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 20FB9E0027E
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 13:54:25 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MBS00JXGSPWD1C2@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 12 Oct 2012 15:54:06 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0AA71202A9; Fri,
	12 Oct 2012 16:53:56 -0400 (EDT)
Date: Fri, 12 Oct 2012 16:53:55 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Enrico Butera <ebutera@users.berlios.de>
Message-id: <20121012205355.GD32601@denix.org>
References: <1350069972-21318-1-git-send-email-ebutera@users.berlios.de>
MIME-version: 1.0
In-reply-to: <1350069972-21318-1-git-send-email-ebutera@users.berlios.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2 1/6] linux-omap4: update to ti-ubuntu-3.4-1487.6
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
X-List-Received-Date: Fri, 12 Oct 2012 20:54:25 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 12, 2012 at 09:26:07PM +0200, Enrico Butera wrote:
> Signed-off-by: Enrico Butera <ebutera@users.berlios.de>

Enrico,

Would you mind if I rather merge Herve's version from here:

https://github.com/rvfh/meta-ti/commit/6342c03a0dba7d906db09630e57e2372998428df

The recipe itself is quite trivial (I even had my own version in the works) 
and I only have couple minor fixes around SRCREV and its comment... But have 
you compared the defconfigs between those two patches? I know the first 
version of your patch used completely different unofficial defconfig... And 
you didn't specify which one you have in v2. I'd prefer to use the defconfig 
that was validated by the GLP team. Thanks.

-- 
Denys

