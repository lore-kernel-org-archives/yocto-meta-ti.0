Return-Path: <m-karicheri2@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57406E0147D
	for <meta-ti@yoctoproject.org>; Wed,  8 May 2013 08:55:59 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r48FtwrI031652
	for <meta-ti@yoctoproject.org>; Wed, 8 May 2013 10:55:58 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r48Ftwn4000768
	for <meta-ti@yoctoproject.org>; Wed, 8 May 2013 10:55:58 -0500
Received: from DFLE11.ent.ti.com ([fe80::56d:4651:6f4f:2245]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Wed, 8 May 2013 10:55:58 -0500
From: "Karicheri, Muralidharan" <m-karicheri2@ti.com>
To: "Rini, Tom" <trini@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [RESEND: PATCH 2/3] keystone2: u-boot: update to add
	gph support
Thread-Index: AQHOS2k9CQkOGrahU0yP1Wpq5JMXdZj6lzmA//+tzGCAAF+lAIABFNWA//+4TcA=
Date: Wed, 8 May 2013 15:55:58 +0000
Message-ID: <3E54258959B69E4282D79E01AB1F32B7044ED737@DFLE11.ent.ti.com>
References: <1367961859-6243-1-git-send-email-m-karicheri2@ti.com>
	<1367961859-6243-2-git-send-email-m-karicheri2@ti.com>
	<20130507215205.GF12982@edge>
	<3E54258959B69E4282D79E01AB1F32B7044ED1DE@DFLE11.ent.ti.com>
	<20130507224012.GJ12982@edge> <518A6B05.5000707@ti.com>
In-Reply-To: <518A6B05.5000707@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [RESEND: PATCH 2/3] keystone2: u-boot: update to add gph support
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
X-List-Received-Date: Wed, 08 May 2013 15:56:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>> -----Original Message-----
>> From: Rini, Tom
>> Sent: Wednesday, May 08, 2013 11:11 AM
>> To: Dmytriyenko, Denys
>> Cc: Karicheri, Muralidharan; Hernandez, Carlos; meta-ti@yoctoproject.org
>> Subject: Re: [meta-ti] [RESEND: PATCH 2/3] keystone2: u-boot: update to =
add gph
>> support
>>=20
>> On 05/07/2013 06:40 PM, Denys Dmytriyenko wrote:
>> > On Tue, May 07, 2013 at 06:07:10PM -0400, Karicheri, Muralidharan wrot=
e:
>> [snip]
>> >>>>> +	cd ${DEPLOY_DIR_IMAGE}
>> >>>>> +	rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
>> >>>>> +	ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
>> >>>>> +	ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
>> >>>>> +	rm -f ${UBOOT_SPI_SPL_BINARY} ${UBOOT_SPI_SPL_SYMLINK}
>> >>>>> +	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_SYMLINK}
>> >>>>> +	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_BINARY}
>> >>>>> +	rm -f ${UBOOT_SPI_BINARY} ${UBOOT_SPI_SYMLINK}
>> >>>>> +	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_SYMLINK}
>> >>>>> +	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_BINARY}
>> >>>>> +	rm -f ${UBOOT_SPI_GPH_BINARY} ${UBOOT_SPI_GPH_SYMLINK}
>> >>>>> +	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_SYMLINK}
>> >>>>> +	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_BINARY} }
>> >>>>
>> >>>> As we just spoke - let's try to generalize this format and combine
>> >>>> it with other similar requirements, like SPL-UART etc. There was a
>> >>>> thread back in February about this...
>> >>
>> >> This is where I have disagreement. Let us restart the discussion. Who
>> >> are the stake holders? Discuss it in this thread rather than using an
>> >> old thread. I have copied here Carlos. I don't have bandwidth to
>> >> spend too much time on this. Let us discuss it and identify what is r=
equired to be done.
>> >
>> > Sure, let's discuss. I encourage everyone to participate, especially
>> > Carlos and Tom.
>>=20
>> We should try and get the generic u-boot.inc to allow for a few differen=
t variables to be
>> set by the machine.conf file, and if they are, copy/symlink them as need=
ed.  I think we
>> should try and fit the SPI selection into the generic u-boot-with-spl.bi=
n framework that
>> exists in u-boot today if we can, and then add some logic so that we can=
 package and
>> symlink that single file instead.

I think we are unable to use the generic due to the specific header format =
requirement from RBL (Rom
Boot loader). So we need to live with the format. How do we handle this wit=
h the existing u-boot-spl.gph
formatting that we use?

>>=20
>> --
>> Tom

