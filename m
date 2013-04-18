Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A1714E0146C
	for <meta-ti@yoctoproject.org>; Thu, 18 Apr 2013 14:50:04 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3ILo3La014377;
	Thu, 18 Apr 2013 16:50:03 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3ILo3WD009733;
	Thu, 18 Apr 2013 16:50:03 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 18 Apr 2013 16:50:02 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r3ILo2I5020432;
	Thu, 18 Apr 2013 16:50:02 -0500
Date: Thu, 18 Apr 2013 17:50:01 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ilya Dmitrichenko <errordeveloper@gmail.com>
Message-ID: <20130418215001.GW1518@edge>
References: <CAPhDKbH84Nhitv+DW6Vcaza0VCjx=T_nw+KUcreico0vBsLAwA@mail.gmail.com>
	<20130418201125.GT1518@edge>
	<CAPhDKbG1A0VdDv5CkApiS_2Bp+4NrTiNV4MZqcE=GNZVZhqAZA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPhDKbG1A0VdDv5CkApiS_2Bp+4NrTiNV4MZqcE=GNZVZhqAZA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Connection refused to git.ti.com
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
X-List-Received-Date: Thu, 18 Apr 2013 21:50:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Apr 18, 2013 at 10:16:47PM +0100, Ilya Dmitrichenko wrote:
> On 18 April 2013 21:11, Denys Dmytriyenko <denys@ti.com> wrote:
> >
> > That's quite strange that you can clone from one machine and always get
> > connection refused from another.
> 
> Yeah, seems like a firewall issue of some kind.
> I forgot to mention explicitly that the two machines are on different
> networks with different public IP addresses.
> 
> Do you have anyway of checking this the server admin?
> I can provide my IP address if needed.

Sure, send me your public IP address off the list and I'll pass it the admins 
to check - maybe it will show up in the logs somewhere...

-- 
Denys

