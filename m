Received: from egress-ip4a.ess.de.barracuda.com (egress-ip4a.ess.de.barracuda.com [18.184.203.227])
 by mx.groups.io with SMTP id smtpd.web12.6033.1618560338265745306
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 16 Apr 2021 01:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=eJbCFWlL;
 spf=pass (domain: mistralsolutions.com, ip: 18.184.203.227, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71]) by mx-outbound8-225.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Fri, 16 Apr 2021 08:05:36 +0000
Received: by mail-wr1-f71.google.com with SMTP id s9-20020a5d51090000b02901028ea30da6so4054612wrt.7
        for <meta-ti@lists.yoctoproject.org>; Fri, 16 Apr 2021 01:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=37PoOMcNbgUEUdZmHFWhwAk57P0Cn23/KeR9xxxur6o=;
        b=eJbCFWlLk+AT67rUevkLgvL9SzZzDYoTCaF1GvaVb/hPDGvEAGAhcbuKKHXW5d5sH4
         Zz/kd5Dxi8PFKus0TrMLb8lCRrKGWoHKRMF3Qm6z8qUx559drG/dwEJcbdi5C5cLMlPh
         OvbZjHjIC17I1ZGaSJMvKF6hrPkvI9dtTmjC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=37PoOMcNbgUEUdZmHFWhwAk57P0Cn23/KeR9xxxur6o=;
        b=YjeqV/pHdePgIwZSykNLnzIV8LJ1VotRRPsGrgZII39CTrkkLTVEpsd2GeAfgQkuuW
         aGTEsEAB5MAezpY5pCcUXZFt+6CFzQ3StATrgemkVZSzAhp9CNUYqv2cTF2KgEsYpDJC
         faKCeuf5J7avONZRLGJdweQ8QRAY9UQVL+nwYRAbA9IkG8ynm139q/9ziNMe/lcsVjaS
         X5Y2OimDRo4fv3iRBkf+Vd0g1XhMlPm+tp3OGO3YhsR68FSSG3xAcri8zTIQr2y3Z31Y
         i+IB4DyRiCQag7p0/2ffhYernqW2GSc3BThbDTfYwmfmF50evX50kESQ+p/YO+dFnJWk
         2tuw==
X-Gm-Message-State: AOAM5313louqRt8IkOGUrtuSM8NmkA3xORowbjgjF/BM/igUDPFL9iRH
	/TBe3UyRNwb5qYijMQTshU6ldy1WPMfjsAOcDt5c22/kmFgzCvh3/fsi7ohT1FLGubglMZjE/V4
	VQDOTw+LiAGsViD+U7BnQUB89yEI/kya5xojp/2bu67dykiNXfuMKh600n4BuZIBHPtwEyzJnoc
	mcz6k=
X-Received: by 2002:adf:e8c3:: with SMTP id k3mr7715375wrn.400.1618560336050;
        Fri, 16 Apr 2021 01:05:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8NT9m7UtX6nOxiAfcCXQ4MX0IXXbqpM/t8DhHlWqRvvtZ078lAgh6Sel3Zo+YmsENdVqqtC326/ga90kMh7I=
X-Received: by 2002:adf:e8c3:: with SMTP id k3mr7715352wrn.400.1618560335831;
 Fri, 16 Apr 2021 01:05:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210408071654.63212-1-sinthu.raja@mistral.in>
 <20210408134409.u24qdeiindwia2hl@paralyses> <CAEd-yTRmTJm80fHNb9VVewxA8zYX4ymDH0OE6LbdQqXVBivFHA@mail.gmail.com>
 <20210415172932.2b46s3imaf5adc5x@subpanel>
In-Reply-To: <20210415172932.2b46s3imaf5adc5x@subpanel>
From: "Sinthu Raja M" <sinthu.raja@mistralsolutions.com>
Date: Fri, 16 Apr 2021 13:35:24 +0530
Message-ID: <CAEd-yTQMtmCFSY4Av-vaEXwh7XScdjugqxt45=Jv4OH6YQ94Hg@mail.gmail.com>
Subject: Re: [meta-ti] [dunfell/master PATCH 3/3] AM64x Unification: Update ti-sci-fw recipe
To: Nishanth Menon <nm@ti.com>, denys@konsulko.com
Cc: meta-ti@lists.yoctoproject.org, Praneeth Bajjuri <praneeth@ti.com>
X-BESS-ID: 1618560336-302273-5593-16852-1
X-BESS-VER: 2019.1_20210414.2120
X-BESS-Apparent-Source-IP: 209.85.221.71
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231590 [from 
	cloudscan23-73.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status: 1
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 15, 2021 at 10:59 PM Nishanth Menon <nm@ti.com> wrote:
>
> On 22:46-20210415, Sinthu Raja M wrote:
> > On Thu, Apr 8, 2021 at 7:14 PM Nishanth Menon <nm@ti.com> wrote:
> > >
> > > On 12:46-20210408, Sinthu Raja M via lists.yoctoproject.org wrote:
> > > > From: Sinthu Raja <x0257345@ti.com>
> > > >
> > > > Updtae ti-sci-fw recipe to build for both SK and EVM compilation and
> > > s/Updtae/Update/
> > >
> > > > installation through one machine name
> > >
> > >
> > > Why are we doing this? What happens to the wic file image? What is the
> > > out of box experience for someone creating an SD image -> flash the
> > > image then modify the sd card? how would that help?
> > >
> > The AM64x EVM and SK have similar rootfs, kernel and u-boot source
> > except for R5 SPL where EVM and SK have two different DDR
> > configurations.
> > Two different processor SDK for EVM and SK creates overhead for
> > customers just for the change in tiboot3.bin. Two avoid the overhead,
> > we are creating two
> > different images for EVM and SK under one MACHINE_NAME (which is am64xx-evm)
> >
> > Two WIC files will be available separately for EVM and SK in the
> > processor SDK installer. Users can use respective WIC files for
> > flashing on to the respective boards.
>
> since meta-yocto, meta-arago etc use the same meta-ti layer,
>
> Could you explain how, in meta-arago/meta-ti am I generating two different wic
> files with the current patch series? I am probably missing some nuance
> in your patches..
>
The patch for generating two WIC files is not added in the current
patch series. I am working on an approach to generate those two WIC
files.
Below is the approach with which I have a working prototype.
1. The meta-arago layer will have two new recipes called
tisdk-base-image-evm.bb and tisdk-base-image-sk.bb for EVM and SK
respectively.
2. These two new recipes will have information on where the boot
images are available which are required for the respective WIC images,
such as IMAGE_BASENAME IMAGE_LINK_NAME IMGDEPLOYDIR  DEPLOY_DIR_IMAGE
3. The two new recipes will be given as the target images for any
bundle creation.

There is another approach which is about bringing in multiple build
machine configurations under a single machine name.
 1. Currently two build configuration such as am64xx-evm and
am64xx-evm-k3r5 are invoked for am64xx-evm
 2. Two more build configurations such as am64xx-sk and am64xx-sk-k3r5
 will be added.
 3. The u-boot and ti-sci-fw recipes will be invoked for am64xx-sk and
am64xx-sk-k3r5
 4. For WIC file generation, inside the sdk bundle recipes, the
IMAGE_BASENAME, IMAGE_LINK_NAME, IMGDEPLOYDIR and  DEPLOY_DIR_IMAGE
variable will be prefixed with am64xx-sk and respective name and path
will be updated/added. This will generate two WIC files for EVM and
SK.
 Note: This approach I don't have prototyped yet. Need your insight in
this approach on the feasibility of adding multiple build
configuration

Denys,
Could you please provide comments on the feasibility on the above approaches.

Thanks & Regards
Sinthu Raja
