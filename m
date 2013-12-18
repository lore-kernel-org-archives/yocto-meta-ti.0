Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E0A2E007F9
	for <meta-ti@yoctoproject.org>; Wed, 18 Dec 2013 10:56:31 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rBIIuTKm010966;
	Wed, 18 Dec 2013 12:56:29 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rBIIuTG0024606;
	Wed, 18 Dec 2013 12:56:29 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 18 Dec 2013 12:56:29 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rBIIuTV5026865;
	Wed, 18 Dec 2013 12:56:29 -0600
Date: Wed, 18 Dec 2013 13:56:29 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Johnson Thomas <johnsonthomas@nanometrics.ca>
Message-ID: <20131218185628.GU24180@edge>
References: <CAL58Aehin5=s1tCLoonZScAQvq2Hp7nwb8zzc4TBpXTSVWfp+Q@mail.gmail.com>
	<20131218174223.GT24180@edge>
	<CAL58Aeg6f29LsVE66AXhtQb0iFU2B6Za_9NPSJW5A-kSajAbSQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL58Aeg6f29LsVE66AXhtQb0iFU2B6Za_9NPSJW5A-kSajAbSQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Latest version of Poky compatible with meta-ti
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
X-List-Received-Date: Wed, 18 Dec 2013 18:56:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Dec 18, 2013 at 01:53:34PM -0500, Johnson Thomas wrote:
> Hi Denys,
> 
> Thanks for the quick response. I will upgrade meta-ti to use dylan and poky
> to either 9.0 or 10.0.

Johnson,

Poky 9 = Dylan
Poky 10 = Dora (I don't have separate branch in meta-ti for Dora yet, but 
master should work)

-- 
Denys


> On Wed, Dec 18, 2013 at 12:42 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> 
> > On Wed, Dec 18, 2013 at 12:36:29PM -0500, Johnson Thomas wrote:
> > > Hi all.
> > >
> > > I have a Yocto project consisting of Poky (Danny-8.0.2), meta-ti (tag:
> > > ti2013.04.00) and a custom BSP layer. I was looking at upgrading the Poky
> > > version to maybe 9.0 or even 10.0. I was wondering, what is the latest
> > > version of Poky that is compatible with meta-ti layer?. Also, is it
> > > recommended to use the "Danny" branch as a stable version for meta-ti
> > layer?
> >
> > Hi,
> >
> > Danny branch is quite old and hasn't been updated in long time (although
> > you
> > are using an older tag from meta-ti/danny). Currently active branches in
> > meta-ti are dylan and master (dora and later). That would correspond to
> > Poky
> > releases version 9 and version 10. We are still using Dylan for our stable
> > releases, but should be switching to Dora soon. So, you can use either
> > Dylan
> > or master from meta-ti, but I won't recommentd staying with Danny.
> >
> > --
> > Denys
> >

