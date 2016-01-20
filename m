Return-Path: <paul.barker.commagility@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 18579E00BA0; Wed, 20 Jan 2016 02:27:01 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [74.125.82.53 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0A5BDE00B94
	for <meta-ti@yoctoproject.org>; Wed, 20 Jan 2016 02:26:57 -0800 (PST)
Received: by mail-wm0-f53.google.com with SMTP id 123so126495357wmz.0
	for <meta-ti@yoctoproject.org>; Wed, 20 Jan 2016 02:26:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
	:references:organization:mime-version:content-type
	:content-transfer-encoding;
	bh=TSeU9b4E4W/+YVZpGiyfkjyy1pXWBX7x85fVyodkSzo=;
	b=C2unPgfVrwUy9zjWKB9SV1OLgvOHyC/fEPYkhuv5ky0NKXu7jhEDMxpLRTcq+2ERJ/
	h5B2qAOP/zeUB6sDVOutKKkKehKsONhKXG2E/sQffpxPHec1jSbYN1lf7D1odkpdnHfy
	eb/tQHbHWl/o7qQI6PqQZR6MSwaRgCcvaRpJeh//eGHQTpJbaWtJ6m/hBs/Htgh/L0oz
	YYdg26niwPFm7kANdW2yPrPcuzbatdqSvTYn+oic3El/jLfw2L01UtKSLcQXOnaPVmFM
	tblaFJw8bWpFBnGNOodxnkNk28br9V7N/g55yfIh7SawI52iOKEA16OboHjUIMk9DmYq
	gAUQ==
X-Gm-Message-State: AG10YOTiH09kCv/IWujkwfb+u9Sa0YnsLNp0/Lrdav5BA6Rs5RDH/zrQuLvt4a3i9tGAlQ==
X-Received: by 10.28.221.85 with SMTP id u82mr3197738wmg.95.1453285616317;
	Wed, 20 Jan 2016 02:26:56 -0800 (PST)
Received: from ku1404 (inno-commagility-ownrouter.lut.ac.uk. [131.231.60.35])
	by smtp.gmail.com with ESMTPSA id
	az10sm32559702wjc.28.2016.01.20.02.26.55
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 02:26:55 -0800 (PST)
Date: Wed, 20 Jan 2016 10:26:51 +0000
From: Paul Barker <paul.barker@commagility.com>
To: Denys Dmytriyenko <denys@ti.com>
Message-ID: <20160120102651.3cbda229@ku1404>
In-Reply-To: <20160119191301.GF4223@edge>
References: <1453218687-30012-1-git-send-email-paul.barker@commagility.com>
	<D9EE8563-6AA4-47D5-9CFE-6638C32B5658@gmail.com>
	<20160119191301.GF4223@edge>
Organization: CommAgility Ltd
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-softhsmv2: Use target includes for zlib and openssl
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
X-List-Received-Date: Wed, 20 Jan 2016 10:27:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 19 Jan 2016 14:13:01 -0500
Denys Dmytriyenko <denys@ti.com> wrote:

> On Tue, Jan 19, 2016 at 11:01:37AM -0800, Khem Raj wrote:
> >=20
> > > On Jan 19, 2016, at 7:51 AM, Paul Barker
> > > <paul.barker@commagility.com> wrote:
> > >=20
> > > ti-softhsmv2 needs to look at the target include directories
> > > instead of the host include directories for zlib and openssl
> > > header files.
> > >=20
> > > Signed-off-by: Paul Barker <paul.barker@commagility.com>
> > > ---
> > > recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb | 5 ++++-
> > > 1 file changed, 4 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
> > > b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb index
> > > c1e1654..dd51309 100644 ---
> > > a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb +++
> > > b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb @@ -21,7 +21,10 @@
> > > S =3D "${WORKDIR}/git" CFLAGS +=3D " -mno-unaligned-access"
> > > CPPFLAGS +=3D " -mno-unaligned-access"
> > >=20
> > > -EXTRA_OECONF +=3D "--with-zlib=3D${STAGING_DIR_HOST}/usr"
> > > +EXTRA_OECONF +=3D " \
> > > +    --with-zlib=3D${STAGING_DIR_TARGET}/usr \
> > > +    --with-openssl=3D${STAGING_DIR_TARGET}/usr \
> > > +    =E2=80=9C
> >=20
> > you know there is STAGING_EXECPREFIXDIR, may be better suited here ?
>=20
> From bitbake.conf:
>=20
> STAGING_EXECPREFIXDIR =3D "${STAGING_DIR_HOST}${exec_prefix}"
>=20

I've looked at bitbake.conf more clearly now:

STAGING_DIR_HOST =3D   "${STAGING_DIR}/${MACHINE}"
STAGING_DIR_TARGET =3D "${STAGING_DIR}/${MACHINE}"

So it actually doesn't matter which of these is used.

I'll send a V2 using STAGING_EXECPREFIXDIR for both zlib and openssl.

Thanks,

--=20
Paul Barker
CommAgility Ltd

