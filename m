Return-Path: <r-monk@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 17661E0132F
	for <meta-ti@yoctoproject.org>; Wed, 15 Feb 2012 07:11:24 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q1FFBMI8021013;
	Wed, 15 Feb 2012 09:11:22 -0600
Received: from DNCE73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q1FFBM6Z004337;
	Wed, 15 Feb 2012 09:11:22 -0600 (CST)
Received: from DNCE02.ent.ti.com ([fe80::e5b6:a692:b14:3c86]) by
	DNCE73.ent.ti.com ([fe80::a454:462:d009:b2c%21]) with mapi id
	14.01.0323.003; Wed, 15 Feb 2012 16:11:22 +0100
From: "Monk, Roger" <r-monk@ti.com>
To: "Peter A. Bigot" <bigotp@acm.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 1/4] ti-eula-unpack: remove extraneous
	newline in	cmd output
Thread-Index: AQHM4BWleBJXFNiAfUuZO9E0mXguMJY+JryQ
Date: Wed, 15 Feb 2012 15:11:20 +0000
Message-ID: <4C82F39BABFE6A429733A300DEBF52240B5E7FC5@DNCE02.ent.ti.com>
References: <1328013657-2069-1-git-send-email-bigotp@acm.org>
	<1328013657-2069-2-git-send-email-bigotp@acm.org>
In-Reply-To: <1328013657-2069-2-git-send-email-bigotp@acm.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-puzzleid: {74DB17AF-8085-44BF-879F-E67E3C5A5651}
x-cr-hashedpuzzle: yVE= BGQM B+Dw E5qn E/2n FnBN GwtK IDjc KOLW LRi8 Phd1
	UDCC Ui8M Vn9/ VuR3 VxGU; 2;
	YgBpAGcAbwB0AHAAQABhAGMAbQAuAG8AcgBnADsAbQBlAHQAYQAtAHQAaQBAAHkAbwBjAHQAbwBwAHIAbwBqAGUAYwB0AC4AbwByAGcA;
	Sosha1_v1; 7; {74DB17AF-8085-44BF-879F-E67E3C5A5651};
	cgAtAG0AbwBuAGsAQAB0AGkALgBjAG8AbQA=; Wed,
	15 Feb 2012 15:07:18 GMT;
	UgBFADoAIABbAG0AZQB0AGEALQB0AGkAXQAgAFsAUABBAFQAQwBIACAAMQAvADQAXQAgAHQAaQAtAGUAdQBsAGEALQB1AG4AcABhAGMAawA6ACAAcgBlAG0AbwB2AGUAIABlAHgAdAByAGEAbgBlAG8AdQBzACAAbgBlAHcAbABpAG4AZQAgAGkAbgAJAGMAbQBkACAAbwB1AHQAcAB1AHQA
x-originating-ip: [137.167.88.84]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] ti-eula-unpack: remove extraneous newline in	cmd output
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Feb 2012 15:11:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2012 at 12:40:54, Peter A. Bigot wrote:
> Subject: [meta-ti] [PATCH 1/4] ti-eula-unpack: remove extraneous
> newline in cmd output
>
> From: "Peter A. Bigot" <bigotp@acm.org>
>
> print adds one already; to add another causes the input to be off and
> the default installation directory to be used, at least on Fedora 15.
>
> Signed-off-by: Peter A. Bigot <bigotp@acm.org>

Acked-by: Roger Monk <r-monk@ti.com>

> ---
>  recipes-ti/includes/ti-eula-unpack.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes-ti/includes/ti-eula-unpack.inc b/recipes-
> ti/includes/ti-eula-unpack.inc index 3b79c24..7c6e7b7 100644
> --- a/recipes-ti/includes/ti-eula-unpack.inc
> +++ b/recipes-ti/includes/ti-eula-unpack.inc
> @@ -53,7 +53,7 @@ python ti_bin_do_unpack() {
>              wdext =3D bb.data.getVar('TI_BIN_UNPK_WDEXT', localdata)
>              wdext =3D bb.data.expand(wdext, localdata)
>              cmd =3D workdir+wdext
> -        print >>f, "%s\n" % cmd
> +        print >>f, cmd
>      f.close()
>
>      # Expand the tarball that was created if required
> --
> 1.7.6.4
>
>
Texas Instruments Limited, 800 Pavilion Drive, Northampton, NN4 7YL. Regist=
ered in England & Wales under company number 00574102

_______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti




