Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.2950.1574635750618850721
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 24 Nov 2019 14:49:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PfyqYyKh;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: denys@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAOMn9Y3011564
	for <meta-ti@lists.yoctoproject.org>; Sun, 24 Nov 2019 16:49:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1574635749;
	bh=eQOmGn9tWxuKLVzO09Iijh3eqkj3hks9lCJXYdKDYtE=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=PfyqYyKhxWEzKzEs/aEdm3awGA+Mwb1x60FAuzIKZfT8XKf6cIAaD7y1rz/hjCYC3
	 xQKweYOsxIioPlisQtNaUHPS2QLlUtLNTcIv0/REjgcsH8602zzUSBNbQpUzXgwChA
	 NgLJ15PMsehlO2gxfkq8IVdcWvw5zQvu1FrV8/FQ=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAOMn9wm112006
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Sun, 24 Nov 2019 16:49:09 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Sun, 24
 Nov 2019 16:49:09 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Sun, 24 Nov 2019 16:49:09 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAOMn9of070436
	for <meta-ti@lists.yoctoproject.org>; Sun, 24 Nov 2019 16:49:09 -0600
Date: Sun, 24 Nov 2019 17:49:09 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] Mailing list platform change November 21st
Message-ID: <20191124224909.GR27719@beryl>
References: <e0299795-a076-faba-6cd2-1a6ccf295f76@linuxfoundation.org>
 <CADfgfoYzWFVsY_KhETe-vto0t7v-uHnKAkzuSoSRvekKtmovWQ@mail.gmail.com>
 <CADfgfoZw57K2zbOXOGj1f0kU+3Nq4varmSatuNxrbxoo1+a9aA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADfgfoZw57K2zbOXOGj1f0kU+3Nq4varmSatuNxrbxoo1+a9aA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

All,

You may have already seen email from Michael about the migration of Yocto 
Project mailing lists to the new management software, quoted below.

For meta-ti subscribers there are 2 major changes:

1. The proper email address of the list is meta-ti@lists.yoctoproject.org - 
please update your adddress books accordingly. The older shorter address of 
meta-ti@yoctoproject.org will still work for some time, but eventually may be 
deprecated.

2. The new Web interface is https://lists.yoctoproject.org/g/meta-ti with 
links to individual posts and patches being different now. The old archives 
have been preserved for now as well, so old links will work for a while.

Please let me know of any questions or issues. Thanks.

-- 
Denys


On Thu, Nov 21, 2019 at 07:59:13PM -0800, Michael Halstead wrote:
> The migration is complete. Please update your address books to point to the
> new list e-mail addresses. There are rewrites in place so the previous
> mailing list addresses will continue to work for a limited time. I am
> sending this message to the old addresses to test that functionality. In
> the next few days we will have redirects for the old pipermail archives to
> keep links working. We are also in the process of setting up
> https://public-inbox.org/README.html for users who would like to retrieve
> list mail using git. Lists and archives are currently accessible via the
> links at https://www.yoctoproject.org/community/mailing-lists/.
> 
> If you are currently a member of any list your account is already created.
> Visit https://lists.yoctoproject.org/sendloginlink and enter the e-mail you
> receive list mail at to receive a login link and set a password.
> 
> If you have questions please visit
> https://wiki.yoctoproject.org/wiki/index.php?title=GroupsMigration to see
> if they have been answered. E-mail pointofcontact@lists.yoctoproject.org
> with new questions.
> 
> --
> Michael Halstead
> Linux Foundation / Yocto Project
> Systems Operations Engineer
> 
> 
> On Wed, Nov 20, 2019 at 11:23 PM Michael Halstead <
> mhalstead@linuxfoundation.org> wrote:
> 
> > The window for the mailing list move has shifted forward to November 21st
> > from 4pm to 8pm Pacific Standard Time. (2019-11-22 00:00-04:00 UTC)
> >
> > Moderators please tend to all pending requests today.
> >
> > Thank you,
> > --
> > Michael Halstead
> > Linux Foundation / Yocto Project
> > Systems Operations Engineer
> >
> > On Fri, Nov 15, 2019 at 4:25 PM Michael Halstead <
> > mhalstead@linuxfoundation.org> wrote:
> >
> >> After backing out of the first attempt to migrate we are again moving
> >> our lists from Mailman to Groups.io. E-mail to lists will be delayed
> >> during the move window on November 21st between 17:00 and 23:00 UTC.
> >>
> >> A new account will be created for you on the Groups.io platform and most
> >> users will only need to update their list mailing address from the
> >> @yoctoproject.org to @lists.yoctoproject.org.
> >>
> >> Moderators please attend to all pending requests next Wednesday November
> >> 20th.
> >>
> >> Please read more about the change on the wiki:
> >>
> >> https://wiki.yoctoproject.org/wiki/index.php?title=GroupsMigration
> >>
> >> If there are serious issues we will rollback the changes. We will e-mail
> >> all lists when work is complete.
> >>
> >> --
> >> Michael Halstead
> >> Linux Foundation / Yocto Project
> >> Systems Operations Engineer
