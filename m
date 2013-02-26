Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E9E43E00312
	for <meta-ti@yoctoproject.org>; Mon, 25 Feb 2013 22:24:29 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MIT002VODSE5IQ4@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 26 Feb 2013 00:24:29 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 09F8020120; Tue,
	26 Feb 2013 01:24:13 -0500 (EST)
Date: Tue, 26 Feb 2013 01:24:13 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-id: <20130226062413.GG6725@denix.org>
References: <1361852468-4352-1-git-send-email-denis@denix.org>
	<CAMKF1sq7h-bhjbCcaPdGHB8MxtZ0dE2LL_rWe2FDB3Uxmc7DNg@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAMKF1sq7h-bhjbCcaPdGHB8MxtZ0dE2LL_rWe2FDB3Uxmc7DNg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] u-boot: add latest mainline release 2013.01.01
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
X-List-Received-Date: Tue, 26 Feb 2013 06:24:30 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Feb 25, 2013 at 10:07:25PM -0800, Khem Raj wrote:
> On Mon, Feb 25, 2013 at 8:21 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > +PR = "r1"
> 
> not as important but better to get rid of it.

Better? There's no harm in it and it prevents you from forgetting to update it 
later. Otherwise it's just a matter or personal preference.

-- 
Denys

