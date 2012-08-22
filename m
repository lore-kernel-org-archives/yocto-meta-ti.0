Return-Path: <raj.khem@gmail.com>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC2C9E00283
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2012 10:08:02 -0700 (PDT)
Received: by eabd1 with SMTP id d1so451864eab.35
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2012 10:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=UmHYDA4fwwMkcgG7J9vI1fhyPyhP920Jve47ANI163s=;
	b=VMOEdqVengHiw9I3QutqhGz9O4AQercOWjYhhy7ytTZNPYlQRLaC9Kuh/3RPk1MVKo
	PUuSR03U7HWU9JivKr7yP/pPHI09ML8ZFYgxaJm0gt1AdMOZmfzyH6eMvtajiQ2eZAXj
	gtwx+88v7J6kxqaQ7x6ttSXUVAuERdKIU3ep+VKswLMTedoQNf++733LpjHVV5WrJ0mY
	VVde8S363aj8x32ycZriw1imZY3VXiU++BLLOsFLOdVTxIreRsQgDbHs+J7jkh7TO0fA
	BvyqnsJl6bZIYA8xQbiraw5VZmMubKSr19W4tFYA9VQch0dLMOFuQDjPiv88D4k0mRv/
	7XTA==
Received: by 10.14.202.131 with SMTP id d3mr19537675eeo.32.1345655281531; Wed,
	22 Aug 2012 10:08:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Wed, 22 Aug 2012 10:07:30 -0700 (PDT)
In-Reply-To: <20120822152450.GA21025@edge>
References: <1345646911-20898-1-git-send-email-raj.khem@gmail.com>
	<20120822152450.GA21025@edge>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Aug 2012 10:07:30 -0700
Message-ID: <CAMKF1spkEvJNcs4fr75jbM9ByCFU__QfiJfZxQOjOUJ6hDdC0A@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] recipes: Replace proto= with protocol= in SRC_URI
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
X-List-Received-Date: Wed, 22 Aug 2012 17:08:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 22, 2012 at 8:24 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> On Wed, Aug 22, 2012 at 07:48:31AM -0700, Khem Raj wrote:
>> protocol is supported proto is not.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> So, how many times this needs fixing?
>

as many times as stale mirrors

here is my problem


[remote "origin"]
        fetch =3D +refs/heads/*:refs/remotes/origin/*
        url =3D git://github.com/Angstrom-distribution/meta-ti.git

and master on that mirror is still at

commit d3ff5630a74640f46ca2ceaef1aa1baa86b9b795
Author: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
Date:   Mon Jul 9 14:35:36 2012 +0200

    netbase: follow oe-core to v5.0

    Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
    Signed-off-by: Denys Dmytriyenko <denys@ti.com>


Koen should angstrom still use meta-ti from github or from git.yp.org
for angstrom-next ?

> --
> Denys
>
>
>> ---
>>  recipes-bsp/ti/am-sysinfo_svn.bb            |    2 +-
>>  recipes-ti/dmai/ti-dmai.inc                 |    2 +-
>>  recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb |    2 +-
>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/recipes-bsp/ti/am-sysinfo_svn.bb b/recipes-bsp/ti/am-sysinf=
o_svn.bb
>> index d4f8740..b73a884 100644
>> --- a/recipes-bsp/ti/am-sysinfo_svn.bb
>> +++ b/recipes-bsp/ti/am-sysinfo_svn.bb
>> @@ -9,7 +9,7 @@ SRCREV =3D "5"
>>  PV =3D "1.0"
>>  PR =3D "r1+svnr${SRCPV}"
>>
>> -SRC_URI =3D "svn://gforge.ti.com/svn/am_sysinfo/;module=3Dtrunk;proto=
=3Dhttps;user=3Danonymous;pswd=3D''"
>> +SRC_URI =3D "svn://gforge.ti.com/svn/am_sysinfo/;module=3Dtrunk;protoco=
l=3Dhttps;user=3Danonymous;pswd=3D''"
>>
>>  S =3D "${WORKDIR}/trunk"
>>
>> diff --git a/recipes-ti/dmai/ti-dmai.inc b/recipes-ti/dmai/ti-dmai.inc
>> index 23481b7..58955b5 100644
>> --- a/recipes-ti/dmai/ti-dmai.inc
>> +++ b/recipes-ti/dmai/ti-dmai.inc
>> @@ -17,7 +17,7 @@ DMAIBRANCH           ?=3D "UNDEFINED_DMAIBRANCH"
>>
>>  S =3D "${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interfac=
e/dmai_${PV}/dmai"
>>
>> -SRC_URI =3D "svn://gforge.ti.com/svn/dmai/;module=3D${DMAIBRANCH};proto=
=3Dhttps;user=3Danonymous;pswd=3D'' \
>> +SRC_URI =3D "svn://gforge.ti.com/svn/dmai/;module=3D${DMAIBRANCH};proto=
col=3Dhttps;user=3Danonymous;pswd=3D'' \
>>               file://loadmodules-ti-dmai-dm6446_al.sh \
>>               file://loadmodules-ti-dmai-dm6467_al.sh \
>>               file://loadmodules-ti-dmai-o3530_al.sh \
>> diff --git a/recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb b/recipes-ti/gs=
treamer-ti/gstreamer-ti_svn.bb
>> index 3d260ed..f314a35 100644
>> --- a/recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb
>> +++ b/recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb
>> @@ -11,7 +11,7 @@ SRCREV =3D "962"
>>  # apply patches from tracker 1208 to get zero copy support.
>>  # https://gstreamer.ti.com/gf/project/gstreamer_ti/tracker/?action=3DTr=
ackerItemEdit&tracker_item_id=3D1208&start=3D175
>>
>> -SRC_URI =3D "svn://gforge.ti.com/svn/gstreamer_ti/trunk;module=3Dgstrea=
mer_ti;proto=3Dhttps;user=3Danonymous;pswd=3D'' \
>> +SRC_URI =3D "svn://gforge.ti.com/svn/gstreamer_ti/trunk;module=3Dgstrea=
mer_ti;protocol=3Dhttps;user=3Danonymous;pswd=3D'' \
>>             file://gstreamer-ti-rc.sh \
>>             file://r962-remove-include-videodev.diff \
>>             file://gstti-init.service \
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti

