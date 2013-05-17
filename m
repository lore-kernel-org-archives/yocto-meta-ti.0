Return-Path: <prabindh@yahoo.com>
Received: from nm36-vm3.bullet.mail.ne1.yahoo.com
	(nm36-vm3.bullet.mail.ne1.yahoo.com [98.138.229.115])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9ABE8E01529
	for <meta-ti@yoctoproject.org>; Fri, 17 May 2013 10:02:16 -0700 (PDT)
Received: from [98.138.226.179] by nm36.bullet.mail.ne1.yahoo.com with NNFMP;
	17 May 2013 17:02:15 -0000
Received: from [98.138.88.236] by tm14.bullet.mail.ne1.yahoo.com with NNFMP;
	17 May 2013 17:02:15 -0000
Received: from [127.0.0.1] by omp1036.mail.ne1.yahoo.com with NNFMP;
	17 May 2013 17:02:15 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 947040.76482.bm@omp1036.mail.ne1.yahoo.com
Received: (qmail 92534 invoked by uid 60001); 17 May 2013 17:02:15 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1368810135; bh=p5+oABkiCUdb+08PXVcn3t/A5nWO4VWHTlBb4l4wt0E=;
	h=X-YMail-OSG:Received:X-Rocket-MIMEInfo:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type;
	b=e4Bw2UJo+OWyORe5xlPaP0WpPcNEifle20LlD9LOuje/3E4VTJaY7TuNXL5vWjh/2WlhVuj3eXY3qw71D2cNRSRYXcm5MQPud/f5Bm92oWaBhNBDTRbrB692os4CMnSbIWsn/BLMBLgtqNjACTRO9p356ERHN12CI9HIZUakZLM=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=X-YMail-OSG:Received:X-Rocket-MIMEInfo:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type;
	b=fSoiAXvj61ts8XcKes6Cuk65yzL1yglrGSxLDtNhoBg++w6UAk804BSKLHX5UiECa4TBfbxN8rWlyW/xzRB/xMEqR14TtQo8yrpHXhJ7sS78jd2BFr9aXom7IY59OQZUkuYjXs5GgMR1TrnohfaEC3pbPIzdB2Es01LUwuf2rN4=;
X-YMail-OSG: ehwbowIVM1k693vVzClQybZplpASHQSGnt6Inmn380NXt6o
	cUgYomZMZ35_j8eAo04nGBh6jg22T7f2BJBCijGYsRWQYFYYxp_d9Ja2Gpd4
	GZpPt.EaBlCtceMG_OAwwetaP2r6.ykBzVUHNt5lbfhUsVdHhYFlM9NEV1tx
	WJg6sS7QYuz.3Kl3t7.ossddSW6QT1NkKWoivsJflNVsKR_zQkjG1yGD287y
	x4rkThmv5UxsPW1tNTttC6d1AikWOZAj0x6H7vYKjcwCeiKDz2stkhO6Wzpp
	5CXqd4GRuGcmwuLtiw8I11hVq_1jnwP1_KPDE3VRIscjgep4ZAenEHecW5_M
	xzBXWvai7UXOogdgXX8LapokEgYi09sNg.oijwtmCKwlg6ag3ojgY2185uFO
	mQSG6qJ68pPOXwGjHnz5UJBjP3UlJU5YrsnYUJa0ZKiIXg1u9._p.rsfENEd
	7LaXwHnIfofn3kKKdJWh35gyfHqcT0QLMSMTr2mBrd7WLeQ_WJc9nN2eiR2Q
	UR5sPScGLgSLUmFGL9XKwzzZiHpCHEkZ5TdsEWaTraP6N8PTfg6MycOb_vtB
	FskKSDZ69Iu6nFVvScq2kF.0Xqw4.sEDT2Vl8g1FzveeWpQfWGpFkBtDT3G2
	xbsHDObFs5pT6W5iCQChs6wyK6Gow8HOnA5frWdoiqJB6f.VyiJP_9IVv5gY
	TSoGlThvn4jnoAGpX1t0tF1hG.TI0N1g43d97VyssHSGbTqs_tbPTe73fbix
	cLxqW542ylzV0nnm_1dRuCCopbvN7FooZgkdzBfM7298l5MoydJjfepkxloT
	qPWpGz_zfofPhXLPMuWA4YVVw4IXPnYcCWKdnDeGqJs9RvE0E.h4FBXgKl6u
	HeC6vSVnqkyx3208UGU8s2..1q5zh9pjWFxJeEPLIvmP28uaEjCjO_H9Pqkr
	gPUv1PHTKDeZrDL0X3fWkDQVa1Dww8rv0VR9184T3oQTK9rXQp.Lcg8.Ji8X
	PsrPrbSBBZGb4i5k4uO8tLnbrH7HsbWdi5CNEeyZtQaX2Plw07h6bUMuu0ud
	UA4Q4AaoBtOT79OxG
Received: from [61.95.193.231] by web125601.mail.ne1.yahoo.com via HTTP;
	Fri, 17 May 2013 10:02:15 PDT
X-Rocket-MIMEInfo: 002.001,
	Q2hhc2UsIERlbnlzLAoKSSBoYXZlIHJlc3VibWl0dGVkIHRoZSBwYXRjaGVzIHdpdGggY29tbWVudHMgaW5jb3Jwb3JhdGVkLiBSUFJPVklERVMgY2xhcmlmaWNhdGlvbiBpcyBwZW5kaW5nIHNvIHN0aWxsIGtlZXBpbmcgYXMgaXQgd2FzLiBQbGVhc2UgcmV2aWV3LAoKCnJlZ2FyZHMKUHJhYnUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwogRnJvbTogIlN1bmRhcmVzb24sIFByYWJpbmRoIiA8cHJhYnVAdGkuY29tPgpUbzogIkRteXRyaXllbmtvLCBEZW55cyIgPGRlbnlzQHRpLmNvbT47ICIBMAEBAQE-
X-Mailer: YahooMailWebService/0.8.142.542
References: <1367501964-6294-1-git-send-email-prabu@ti.com>
	<7D46E86EC0A8354091174257B2FED10159546F17@DLEE11.ent.ti.com>
	<321768C95D21724485BCE784F1BE98473EB10BED@DBDE04.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED10159554BA4@DLEE11.ent.ti.com>
	<20130514172316.GB31835@denix.org> <20130514174650.GB19116@edge>
	<321768C95D21724485BCE784F1BE98473EB16422@DBDE04.ent.ti.com>
Message-ID: <1368810135.92464.YahooMailNeo@web125601.mail.ne1.yahoo.com>
Date: Fri, 17 May 2013 10:02:15 -0700 (PDT)
From: Prabindh Sundareson <prabindh@yahoo.com>
To: "Sundareson, Prabindh" <prabu@ti.com>,
	"Dmytriyenko, Denys" <denys@ti.com>, "Maupin, Chase" <chase.maupin@ti.com>
In-Reply-To: <321768C95D21724485BCE784F1BE98473EB16422@DBDE04.ent.ti.com>
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 01/10] libgles-omap3: Remove X11 related build and	packaging
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: Prabindh Sundareson <prabindh@yahoo.com>
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 17 May 2013 17:02:17 -0000
Content-Type: multipart/alternative;
	boundary="-1981468715-1279370570-1368810135=:92464"

---1981468715-1279370570-1368810135=:92464
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Chase, Denys,=0A=0AI have resubmitted the patches with comments incorporate=
d. RPROVIDES clarification is pending so still keeping as it was. Please re=
view,=0A=0A=0Aregards=0APrabu=0A=0A=0A________________________________=0A F=
rom: "Sundareson, Prabindh" <prabu@ti.com>=0ATo: "Dmytriyenko, Denys" <deny=
s@ti.com>; "Maupin, Chase" <chase.maupin@ti.com> =0ACc: "meta-ti@yoctoproje=
ct.org" <meta-ti@yoctoproject.org> =0ASent: Wednesday, May 15, 2013 8:18 AM=
=0ASubject: Re: [meta-ti] [PATCH 01/10] libgles-omap3: Remove X11 related b=
uild and=09packaging=0A =0A=0ADenys,=0A=0AThanks for the review. I will res=
ubmit the patch-set for review - with below comments implemented. =0A=0Areg=
ards,=0APrabu=0A=0A=0A-----Original Message-----=0AFrom: meta-ti-bounces@yo=
ctoproject.org [mailto:meta-ti-bounces@yoctoproject.org] On Behalf Of Dmytr=
iyenko, Denys=0ASent: Tuesday, May 14, 2013 11:17 PM=0ATo: Maupin, Chase=0A=
Cc: meta-ti@yoctoproject.org=0ASubject: Re: [meta-ti] [PATCH 01/10] libgles=
-omap3: Remove X11 related build and packaging=0A=0APrabu,=0A=0AI don't thi=
nk I have any more comments, than for 01, 06 and 08. Will you be re-submitt=
ing the entire set later? I'll go ahead and remove this set from my queue a=
s it will be "superseded". Thanks!=0A=0A--=0ADenys=0A=0A=0AOn Tue, May 14, =
2013 at 01:23:16PM -0400, Denys Dmytriyenko wrote:=0A> On Fri, May 10, 2013=
 at 01:27:09PM +0000, Maupin, Chase wrote:=0A> > =0A> > >-----Original Mess=
age-----=0A> > >From: Sundareson, Prabindh=0A> > >Sent: Friday, May 10, 201=
3 4:17 AM=0A> > >To: Maupin, Chase; meta-ti@yoctoproject.org=0A> > >Subject=
: RE: [meta-ti] [PATCH 01/10] libgles-omap3: Remove X11=0A> > >related buil=
d and packaging=0A> > >=0A> > >Chase, thanks for the review,=0A> > >=0A> > =
>1) Ok, I will add it. By "later recipe", you mean the separated=0A> > >x11=
 recipe, right ?=0A> > =0A> > Yes sir=0A> > =0A> > >=0A> > >2) Good point -=
 I am ok to leave the old .inc and create a new one=0A> > >with the changes=
 starting from 4.09 then. Is this ok ?=0A> > =0A> > I'm OK with the approac=
h.=A0 Denys, any concern here?=0A> =0A> Sounds good - there are still some =
users of 4.08 out there...=0A> =0A> =0A> > >regards,=0A> > >Prabu=0A> > >=
=0A> > >=0A> > >-----Original Message-----=0A> > >From: Maupin, Chase=0A> >=
 >Sent: Wednesday, May 08, 2013 6:48 PM=0A> > >To: Sundareson, Prabindh; me=
ta-ti@yoctoproject.org=0A> > >Subject: RE: [meta-ti] [PATCH 01/10] libgles-=
omap3: Remove X11=0A> > >related build and packaging=0A> > >=0A> > >Prabu,=
=0A> > >=0A> > >Overall nice job.=A0 A couple of things I noticed.=0A> > >=
=0A> > >1. You removed the sample.desktop file but did not put it back in=
=0A> > >a later recipe.=0A> > >2. You modified the common .inc file and the=
n added the X11 pieces=0A> > >back for 4.09.00.01.=A0 This would break peop=
le using the older=0A> > >recipes though.=A0 So would it perhaps be a good =
idea to leave the=0A> > >.inc alone and then create a new include file for =
newer recipe=0A> > >that do this split going forward?=A0 Or would it be sim=
pler to=0A> > >provide the X11 package for the older versions as well?=A0 T=
his is=0A> > >just a thought and I'm hoping others will chime in here.=0A> =
> >=0A> > >Thanks for the patches, it is really good to see this work being=
=0A> > >done :)=0A> > >=0A> > >> -----Original Message-----=0A> > >> From: =
meta-ti-bounces@yoctoproject.org [mailto:meta-ti-=0A> > >> bounces@yoctopro=
ject.org] On Behalf Of Sundareson, Prabindh=0A> > >> Sent: Thursday, May 02=
, 2013 8:39 AM=0A> > >> To: meta-ti@yoctoproject.org=0A> > >> Subject: [met=
a-ti] [PATCH 01/10] libgles-omap3: Remove X11=0A> > >related=0A> > >> build=
 and packaging=0A> > >>=0A> > >> The SGX530 driver for X11 is only buildabl=
e and testable=0A> > >standalone=0A> > >> with the pre-built X11 package pr=
ovided with the Graphics SDK.=0A> > >> This patch removes X11 build from th=
e default recipe, to enable=0A> > >moving=0A> > >> X11 build to a separate =
recipe.=0A> > >>=0A> > >> This is part of a clean up of the Graphics recipe=
 starting from=0A> > >> 4.09.00.01 version of the Graphics SDK.=0A> > >>=0A=
> > >> Signed-off-by: Prabindh Sundareson <prabu@ti.com>=0A> > >> ---=0A> >=
 >>=A0 recipes-graphics/libgles/libgles-omap3.inc=A0 =A0 =A0 =A0  |=A0 168 =
++++-=0A> > >-=0A> > >> --------------=0A> > >>=A0 .../libgles/libgles-omap=
3_4.09.00.01.bb=A0 =A0 =A0 =A0 =A0 =A0 |=A0  43 +----=0A> > >-=0A> > >>=A0 =
2 files changed, 30 insertions(+), 181 deletions(-)=0A> > >>=0A> > >> diff =
--git a/recipes-graphics/libgles/libgles-omap3.inc=0A> > >> b/recipes-graph=
ics/libgles/libgles-omap3.inc=0A> > >> index 9a90c56..130dc49 100644=0A> > =
>> --- a/recipes-graphics/libgles/libgles-omap3.inc=0A> > >> +++ b/recipes-=
graphics/libgles/libgles-omap3.inc=0A> > >> @@ -7,10 +7,6 @@ PR =3D "r35"=
=0A> > >>=0A> > >>=A0 COMPATIBLE_MACHINE =3D "(omap3|ti814x|ti816x|ti33x)"=
=0A> > >>=0A> > >> -X11DEPENDS =3D "virtual/libx11 libxau libxdmcp libdrm"=
=0A> > >> -DEPENDS =3D "${@base_contains('DISTRO_FEATURES', 'x11',=0A> > >>=
 '${X11DEPENDS}', '', d)}"=0A> > >> -=0A> > >> -export SUPPORT_XORG ?=3D "$=
{@base_contains('DISTRO_FEATURES',=0A> > >> 'x11', '1', '0', d)}"=0A> > >>=
=A0 PVR_INIT ?=3D "pvrsrvinit"=0A> > >>=0A> > >>=A0 PROVIDES +=3D "virtual/=
egl virtual/libgles1 virtual/libgles2"=0A> > >> @@ -22,7 +18,6 @@ RREPLACES=
_${PN}-dbg =3D "libegl-dbg"=0A> > >>=A0 SRC_URI =3D "http://software-=0A> >=
 >>=0A> > >dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXP=
V=0A> > >> }/exports/${BINFILE} \=0A> > >>=A0 =A0=A0=A0 =A0=A0=A0 =A0  file=
://cputype \=0A> > >>=A0 =A0=A0=A0 =A0=A0=A0 =A0  file://rc.pvr \=0A> > >> =
-=A0=A0=A0 =A0=A0=A0 =A0  file://sample.desktop \=0A> > >>=A0 =A0=A0=A0 =A0=
=A0=A0 =A0  file://99-bufferclass.rules=A0 \=0A> > >>=A0 "=0A> > >>=0A> > >=
> @@ -79,87 +74,53 @@ do_compile() {=0A> > >>=A0 =A0=A0=A0 export PLAT_CPP=
=3D"${CXX}"=0A> > >>=A0 =A0=A0=A0 export PLAR_AR=3D"${AR}"=0A> > >>=0A> > >=
> -=A0=A0=A0 if [ ${SUPPORT_XORG} -eq 1 ] ; then=0A> > >> -=A0=A0=A0 =A0=A0=
=A0 export X11ROOT=3D"${STAGING_DIR_HOST}/usr"=0A> > >> -=A0=A0=A0 =A0=A0=
=A0 mkdir -p ${S}/demos/x11=0A> > >> -=A0=A0=A0 =A0=A0=A0 mkdir -p ${S}/tra=
iningcourses/x11=0A> > >> -=A0=A0=A0 fi=0A> > >> -=0A> > >>=A0 =A0=A0=A0 mk=
dir -p ${S}/demos/raw=0A> > >>=A0 =A0=A0=A0 mkdir -p ${S}/trainingcourses/r=
aw=0A> > >>=0A> > >>=A0 =A0=A0=A0 # Rebuild demos=0A> > >> -=A0=A0=A0 for X=
11BUILD in 0 1 ; do=0A> > >> -=A0=A0=A0 =A0=A0=A0 # Don't rebuild demos wit=
h X11 support for a non X11=0A> > >> distro=0A> > >> -=A0=A0=A0 =A0=A0=A0 i=
f [ ${SUPPORT_XORG} -eq 0 -a $X11BUILD -eq 1 ] ;=0A> > >> then=0A> > >> -=
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 continue=0A> > >> -=A0=A0=A0 =A0=A0=A0 fi=0A>=
 > >> +=A0=A0=A0 for demo in ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Demos/* ;=
=0A> > >> do=0A> > >> +=A0=A0=A0 =A0=A0=A0 cd $demo/OGLES/Build/LinuxGeneri=
c=0A> > >> +=A0=A0=A0 =A0=A0=A0 oe_runmake Common=3D1 PLATFORM=3D${PLATFORM=
} X11BUILD=3D0=0A> > >> +=A0=A0=A0 =A0=A0=A0 rm $demo/OGLES/Build/${PLATFOR=
M}/Release*/*.o=0A> > >> +=0A> > >> +=A0=A0=A0 =A0=A0=A0 install -m 0755=0A=
> > >> $demo/OGLES/Build/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw ||=0A> > >=
true=0A> > >> +=A0=A0=A0 done=0A> > >> +=0A> > >> +=A0=A0=A0 for demo in ${=
S}/GFX_Linux_SDK/OGLES2/SDKPackage/Demos/* ;=0A> > >> do=0A> > >> +=A0=A0=
=A0 =A0=A0=A0 cd $demo/OGLES2/Build/LinuxGeneric=0A> > >> +=A0=A0=A0 =A0=A0=
=A0 oe_runmake Common=3D1 PLATFORM=3D${PLATFORM} X11BUILD=3D0=0A> > >> +=A0=
=A0=A0 =A0=A0=A0 rm -f $demo/OGLES2/Build/${PLATFORM}/Release*/*.o=0A> > >>=
=0A> > >> -=A0=A0=A0 =A0=A0=A0 for demo in=0A> > >> ${S}/GFX_Linux_SDK/OGLE=
S/SDKPackage/Demos/* ; do=0A> > >> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 cd $demo/=
OGLES/Build/LinuxGeneric=0A> > >> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 oe_runmake=
 Common=3D1 PLATFORM=3D${PLATFORM}=0A> > >> X11BUILD=3D$X11BUILD=0A> > >> -=
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 rm $demo/OGLES/Build/${PLATFORM}/Release*/*.o=
=0A> > >> -=0A> > >> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 if [ $X11BUILD -eq 1 ] =
; then=0A> > >> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 install -m 0755=0A=
> > >> $demo/OGLES/Build/${PLATFORM}/ReleaseX11/* ${S}/demos/x11 ||=0A> > >=
true=0A> > >> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 sed -e s:NAME:$(base=
name $demo): \=0A> > >> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0 =A0 -e=
=0A> > >> s:EXEC:${bindir}/SGX/demos/X11/$(basename=0A> > >> $demo/OGLES/Bu=
ild/${PLATFORM}/ReleaseX11/*): \=0A> > >> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =
=A0=A0=A0 =A0 =A0 ${WORKDIR}/sample.desktop >=0A> > >> ${WORKDIR}/$(basenam=
e $demo).desktop=0A> > >> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 else=0A> > >> -=A0=
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 install -m 0755=0A> > >> $demo/OGLES/B=
uild/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw ||=0A> > >true=0A> > >> -=A0=
=A0=A0 =A0=A0=A0 =A0=A0=A0 fi=0A> > >> -=A0=A0=A0 =A0=A0=A0 done=0A> > >> -=
=0A> > >> -=A0=A0=A0 =A0=A0=A0 for demo in=0A> > >> ${S}/GFX_Linux_SDK/OGLE=
S2/SDKPackage/Demos/* ; do=0A> > >> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 cd $demo=
/OGLES2/Build/LinuxGeneric=0A> > >> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 oe_runma=
ke Common=3D1 PLATFORM=3D${PLATFORM}=0A> > >> X11BUILD=3D$X11BUILD=0A> > >>=
 -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 rm -f=0A> > >> $demo/OGLES2/Build/${PLATFOR=
M}/Release*/*.o=0A> > >> -=0A> > >> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 if [ $X1=
1BUILD -eq 1 ] ; then=0A> > >> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 ins=
tall -m 0755=0A> > >> $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/* ${S}/demo=
s/x11 ||=0A> > >true=0A> > >> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 sed =
-e s:NAME:$(basename $demo): \=0A> > >> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=
=A0=A0 =A0 =A0 -e=0A> > >> s:EXEC:${bindir}/SGX/demos/X11/$(basename=0A> > =
>> $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/*): \=0A> > >> -=A0=A0=A0 =A0=
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0 =A0 ${WORKDIR}/sample.desktop >=0A> > >> ${W=
ORKDIR}/$(basename $demo).desktop=0A> > >> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 e=
lse=0A> > >> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 install -m 0755=0A> >=
 >> $demo/OGLES2/Build/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw ||=0A> > >tr=
ue=0A> > >> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 fi=0A> > >> -=A0=A0=A0 =A0=A0=A0=
 done=0A> > >> +=A0=A0=A0 =A0=A0=A0 install -m 0755=0A> > >> $demo/OGLES2/B=
uild/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw ||=0A> > >true=0A> > >>=A0 =A0=
=A0=A0 done=0A> > >>=0A> > >>=A0 =A0=A0=A0 find ${S} -name "*_org" -delete=
=0A> > >>=0A> > >>=A0 =A0=A0=A0 # Build OGLES2 Trainingcourses=0A> > >> -=
=A0=A0=A0 for X11BUILD in 0 1 ; do=0A> > >> -=A0=A0=A0 =A0=A0=A0 # Don't re=
build training courses with X11 support for=0A> > >> a non X11 distro=0A> >=
 >> -=A0=A0=A0 =A0=A0=A0 if [ ${SUPPORT_XORG} -eq 0 -a $X11BUILD -eq 1 ] ;=
=0A> > >> then=0A> > >> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 continue=0A> > >> +=
=A0=A0=A0 for training in=0A> > >> ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Tra=
iningCourse/* ; do=0A> > >> +=A0=A0=A0 =A0=A0=A0 if [ -e $training/OGLES2/B=
uild/LinuxGeneric/Makefile=0A> > >> ] ; then=0A> > >> +=A0=A0=A0 =A0=A0=A0 =
=A0=A0=A0 cd $training/OGLES2/Build/LinuxGeneric=0A> > >>=A0 =A0=A0=A0 =A0=
=A0=A0 fi=0A> > >>=0A> > >> -=A0=A0=A0 =A0=A0=A0 for training in=0A> > >> $=
{S}/GFX_Linux_SDK/OGLES2/SDKPackage/TrainingCourse/* ; do=0A> > >> -=A0=A0=
=A0 =A0=A0=A0 =A0=A0=A0 if [ -e=0A> > >> $training/OGLES2/Build/LinuxGeneri=
c/Makefile ] ; then=0A> > >> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 cd $t=
raining/OGLES2/Build/LinuxGeneric=0A> > >> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 f=
i=0A> > >> -=0A> > >> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 if [ -e=0A> > >> $trai=
ning/OGLES2/Build/${PLATFORM}/Makefile ] ; then=0A> > >> -=A0=A0=A0 =A0=A0=
=A0 =A0=A0=A0 =A0=A0=A0 cd $training/OGLES2/Build/${PLATFORM}=0A> > >> -=A0=
=A0=A0 =A0=A0=A0 =A0=A0=A0 fi=0A> > >> +=A0=A0=A0 =A0=A0=A0 if [ -e $traini=
ng/OGLES2/Build/${PLATFORM}/Makefile ]=0A> > >> ; then=0A> > >> +=A0=A0=A0 =
=A0=A0=A0 =A0=A0=A0 cd $training/OGLES2/Build/${PLATFORM}=0A> > >> +=A0=A0=
=A0 =A0=A0=A0 fi=0A> > >>=0A> > >> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 oe_runmak=
e Common=3D1 PLATFORM=3D${PLATFORM}=0A> > >> X11BUILD=3D$X11BUILD=0A> > >> =
-=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 rm -f=0A> > >> $training/OGLES2/Build/${PLAT=
FORM}/Release*/*.o=0A> > >> +=A0=A0=A0 =A0=A0=A0 oe_runmake Common=3D1 PLAT=
FORM=3D${PLATFORM} X11BUILD=3D0=0A> > >> +=A0=A0=A0 =A0=A0=A0 rm -f $traini=
ng/OGLES2/Build/${PLATFORM}/Release*/*.o=0A> > >>=0A> > >> -=A0=A0=A0 =A0=
=A0=A0 =A0=A0=A0 if [ $X11BUILD -eq 1 ] ; then=0A> > >> -=A0=A0=A0 =A0=A0=
=A0 =A0=A0=A0 =A0=A0=A0 install -m 0755=0A> > >> $training/OGLES2/Build/${P=
LATFORM}/ReleaseX11/*=0A> > >> ${S}/trainingcourses/x11 || true=0A> > >> -=
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 else=0A> > >> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =
=A0=A0=A0 install -m 0755=0A> > >> $training/OGLES2/Build/${PLATFORM}/Relea=
seRaw/*=0A> > >> ${S}/trainingcourses/raw || true=0A> > >> -=A0=A0=A0 =A0=
=A0=A0 =A0=A0=A0 fi=0A> > >> -=A0=A0=A0 =A0=A0=A0 done=0A> > >> +=A0=A0=A0 =
=A0=A0=A0 install -m 0755=0A> > >> $training/OGLES2/Build/${PLATFORM}/Relea=
seRaw/*=0A> > >> ${S}/trainingcourses/raw || true=0A> > >>=A0 =A0=A0=A0 don=
e=0A> > >>=0A> > >> +=0A> > >>=A0 }=0A> > >>=0A> > >>=A0 do_install () {=0A=
> > >>=A0 =A0=A0=A0 install -d ${D}${libdir}=0A> > >>=A0 =A0=A0=A0 cp -pPR =
${BINLOCATION}/*.so* ${D}${libdir}=0A> > >> + =A0=A0=A0 rm ${D}${libdir}/li=
bpvrPVR2D_DRIWSEGL.so*=0A> > >> + =A0=A0=A0 rm ${D}${libdir}/libsrv_um_dri.=
so*=0A> > >> + =A0=A0=A0 rm ${D}${libdir}/pvr_drv.so*=0A> > >>=A0 =A0=A0=A0=
 install -m 0644 ${BINLOCATION}/*.a ${D}${libdir}=0A> > >>=0A> > >>=A0 =A0=
=A0=A0 install -d ${D}${bindir}/=0A> > >> @@ -169,12 +130,6 @@ do_install (=
) {=0A> > >>=A0 =A0=A0=A0 install -m 0755 ${BINLOCATION}/gl* ${D}${bindir}/=
=0A> > >>=A0 =A0=A0=A0 install -m 0755 ${BINLOCATION}/${PVR_INIT} ${D}${bin=
dir}/=0A> > >>=0A> > >> -=A0=A0=A0 if [ ${SUPPORT_XORG} -eq 1 ] ; then=0A> =
> >> -=A0=A0=A0 =A0=A0=A0 install -m 0755 ${BINLOCATION}/xgles1test1=0A> > =
>> ${D}${bindir}/=0A> > >> -=A0=A0=A0 =A0=A0=A0 install -m 0755=0A> > >> ${=
BINLOCATION}/freedesktop/kdrive/usr/X11R6_SGX/bin/Xsgx=0A> > >> ${D}${bindi=
r}/|| true=0A> > >> -=A0=A0=A0 =A0=A0=A0 cp -pPR=0A> > >>=0A> > >${S}/GFX_L=
inux_SDK/OGLES2/SDKPackage/Builds/OGLES2/${PLATFORM}/li=0A> > >> b/*X11WS* =
${D}${libdir} || true=0A> > >> -=A0=A0=A0 fi=0A> > >> -=0A> > >>=A0 =A0=A0=
=A0 install -d ${D}${includedir}=0A> > >>=A0 =A0=A0=A0 cp -pPR ${S}/GFX_Lin=
ux_KM/include4 ${D}${includedir}/=0A> > >>=A0 =A0=A0=A0 cp -pPR ${S}/GFX_Li=
nux_KM/services4 ${D}${includedir}/ @@ -=0A> > >211,13=0A> > >> +166,12 @@ =
do_install () {=0A> > >>=0A> > >>=A0 =A0=A0=A0 shared_prog=3D"eglinfo pvr2d=
_test ${PVR_INIT} services_test=0A> > >> sgx_blit_test sgx_clipblit_test sg=
x_flip_test sgx_init_test=0A> > >> sgx_render_flip_test"=0A> > >>=A0 =A0=A0=
=A0 raw_prog=3D"gles1test1 gles2test1 ovg_unit_test"=0A> > >> -=A0=A0=A0 x1=
1_prog=3D"eglinfo_x xgles1test1 xgles2test1 xmultiegltest=0A> > >> xovg_uni=
t_test"=0A> > >>=0A> > >>=A0 =A0=A0=A0 for esrev in 2 3 5 6 8 ; do=0A> > >>=
=A0 =A0=A0=A0 =A0=A0=A0 ESLOCATION=3D$(eval echo $(echo=0A> > >> \$\{ES${es=
rev}LOCATION\}))=0A> > >>=A0 =A0=A0=A0 =A0=A0=A0 if [ -e ${ESLOCATION} ] ; =
then=0A> > >>=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 cp -pPR ${ESLOCATION}/lib*${=
IMGPV}=0A> > >${ESLOCATION}/pvr_drv.so=0A> > >> ${ESLOCATION}/*.a ${D}${lib=
dir}/ES${esrev}.0/=0A> > >> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 for esprog in $s=
hared_prog $raw_prog=0A> > >> ${@base_contains('DISTRO_FEATURES', 'x11',"$x=
11_prog","",d)} ;=0A> > >do=0A> > >> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 for esp=
rog in $shared_prog $raw_prog ; do=0A> > >>=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=
=A0 =A0=A0=A0 install -m 0755 ${ESLOCATION}/$esprog=0A> > >${D}${bindir}/ES=
${esrev}.0/=0A> > >> 2>/dev/null || true=0A> > >>=A0 =A0=A0=A0 =A0=A0=A0 =
=A0=A0=A0 done=0A> > >>=A0 =A0=A0=A0 =A0=A0=A0 fi=0A> > >> @@ -225,17 +179,=
6 @@ do_install () {=0A> > >>=0A> > >>=A0 =A0=A0=A0 rm ${D}${bindir}/ES*/*.=
h ${D}${bindir}/ES*/pdsasm=0A> > >> ${D}${bindir}/pdsasm -f || true=0A> > >=
>=0A> > >> -=A0=A0=A0 install -d ${D}${prefix}/share/applications=0A> > >> =
-=A0=A0=A0 cp ${WORKDIR}/*.desktop ${D}${prefix}/share/applications=0A> > >=
> -=A0=A0=A0 rm ${D}${prefix}/share/applications/sample.desktop=0A> > >> -=
=0A> > >> -=A0=A0=A0 if [ ${SUPPORT_XORG} -eq 1 ] ; then=0A> > >> -=A0=A0=
=A0 =A0=A0=A0 install -d ${D}${bindir}/SGX/demos/X11/=0A> > >> -=A0=A0=A0 =
=A0=A0=A0 install -m 0755 ${S}/demos/x11/*=0A> > >> ${D}${bindir}/SGX/demos=
/X11/=0A> > >> -=A0=A0=A0 =A0=A0=A0 install -d ${D}${bindir}/SGX/trainingco=
urses/X11=0A> > >> 2>/dev/null || true=0A> > >> -=A0=A0=A0 =A0=A0=A0 instal=
l -m 0755 ${S}/trainingcourses/x11/*=0A> > >> ${D}${bindir}/SGX/trainingcou=
rses/X11/ 2>/dev/null || true=0A> > >> -=A0=A0=A0 fi=0A> > >> -=0A> > >>=A0=
 =A0=A0=A0 install -d ${D}${bindir}/SGX/demos/Raw/=0A> > >>=A0 =A0=A0=A0 in=
stall -m 0755 ${S}/demos/raw/*=0A> > >> ${D}${bindir}/SGX/demos/Raw/=0A> > =
>>=A0 =A0=A0=A0 install -d ${D}${bindir}/SGX/trainingcourses/Raw=0A> > >> 2=
>/dev/null || true=0A> > >> @@ -251,8 +194,7 @@ do_install () {=0A> > >>=0A=
> > >>=A0 }=0A> > >>=0A> > >> -PACKAGES =3D+ "${@base_contains('DISTRO_FEAT=
URES', 'x11',"${PN}-=0A> > >> x11demos ${PN}-x11trainingcourses xserver-kdr=
ive-powervrsgx"=0A> > >,"", d)}=0A> > >> \=0A> > >> -=A0 =A0 =A0 =A0 =A0 =
=A0  ${PN}-rawdemos ${PN}-rawtrainingcourses ${PN}-=0A> > >> tests"=0A> > >=
> +PACKAGES =3D+ "${PN}-rawdemos ${PN}-rawtrainingcourses ${PN}-=0A> > >> t=
ests"=0A> > >>=A0 # Package the base libraries per silicon revision=A0 PACK=
AGES =3D+=0A> > >> "${PN}-es2 ${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8"=0A> =
> >>=A0 RRECOMMENDS_${PN} +=3D "${PN}-es2 ${PN}-es3 ${PN}-es5 ${PN}-es6=0A>=
 > >> ${PN}-es8"=0A> > >> @@ -271,18 +213,14 @@ PRIVATE_LIBS_${PN}-es8 =3D =
"libGLESv2.so=0A> > >> libIMGegl.so libsrv_um.so libOpenVG.so li=0A> > >>=
=0A> > >>=0A> > >>=A0 PACKAGES =3D+ "${PN}-blitwsegl ${PN}-flipwsegl ${PN}-=
frontwsegl=0A> > >> ${PN}-linuxfbwsegl"=0A> > >> -PACKAGES =3D+ "${@base_co=
ntains('DISTRO_FEATURES', 'x11',"${PN}-=0A> > >> x11wsegl ${PN}-driwsegl" ,=
"", d)}"=0A> > >> +=0A> > >>=A0 FILES_${PN}-blitwsegl =3D "${libdir}/libpvr=
PVR2D_BLITWSEGL.so.*"=0A> > >>=A0 FILES_${PN}-flipwsegl =3D "${libdir}/libp=
vrPVR2D_FLIPWSEGL.so.*"=0A> > >>=A0 FILES_${PN}-frontwsegl =3D=0A> > >"${li=
bdir}/libpvrPVR2D_FRONTWSEGL.so.*"=0A> > >>=A0 FILES_${PN}-linuxfbwsegl =3D=
=0A> > >> "${libdir}/libpvrPVR2D_LINUXFBWSEGL.so.*"=0A> > >> -FILES_${PN}-x=
11wsegl =3D "${libdir}/libpvrPVR2D_X11WSEGL.so*=0A> > >> ${bindir}/x* ${bin=
dir}/*x"=0A> > >> -FILES_${PN}-driwsegl =3D "${libdir}/libpvrPVR2D_DRIWSEGL=
.so*=0A> > >> ${libdir}/libsrv_um_dri*"=0A> > >>=0A> > >>=A0 PACKAGES =3D+ =
"${PN}-blitwsegl-es2 ${PN}-blitwsegl-es3 ${PN}-=0A> > >> blitwsegl-es5 ${PN=
}-blitwsegl-es6 ${PN}-blitwsegl-es8 ${PN}-=0A> > >> flipwsegl-es2 ${PN}-fli=
pwsegl-es3 ${PN}-flipwsegl-es5 ${PN}-=0A> > >> flipwsegl-es6 ${PN}-flipwseg=
l-es8 ${PN}-frontwsegl-es2 ${PN}-=0A> > >> frontwsegl-es3 ${PN}-frontwsegl-=
es5 ${PN}-frontwsegl-es6 ${PN}-=0A> > >> frontwsegl-es8 ${PN}-linuxfbwsegl-=
es2 ${PN}-linuxfbwsegl-es3=0A> > >> ${PN}-linuxfbwsegl-es5 ${PN}-linuxfbwse=
gl-es6 ${PN}-=0A> > >linuxfbwsegl- es8"=0A> > >>=0A> > >> -X11_SEGL =3D " $=
{PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-=0A> > >> x11wsegl-es5 ${PN}-x11=
wsegl-es6 ${PN}-x11wsegl-es8 ${PN}-=0A> > >> driwsegl-es2 ${PN}-driwsegl-es=
3 ${PN}-driwsegl-es5 ${PN}-=0A> > >> driwsegl-es6 ${PN}-driwsegl-es8 "=0A> =
> >> -PACKAGES =3D+ "${@base_contains('DISTRO_FEATURES',=0A> > >> 'x11',"${=
X11_SEGL}" ,"", d)}"=0A> > >>=A0 FILES_${PN}-blitwsegl-es2 =3D=0A> > >> "${=
libdir}/ES2*/libpvrPVR2D_BLITWSEGL.so.*"=0A> > >>=A0 FILES_${PN}-blitwsegl-=
es3 =3D=0A> > >> "${libdir}/ES3*/libpvrPVR2D_BLITWSEGL.so.*"=0A> > >>=A0 FI=
LES_${PN}-blitwsegl-es5 =3D=0A> > >> "${libdir}/ES5*/libpvrPVR2D_BLITWSEGL.=
so.*"=0A> > >> @@ -311,25 +249,10 @@ FILES_${PN}-linuxfbwsegl-es6 =3D=0A> >=
 >> "${libdir}/ES6*/libpvrPVR2D_LINUXFBWSEGL.so.*"=0A> > >>=A0 FILES_${PN}-=
linuxfbwsegl-es8 =3D=0A> > >> "${libdir}/ES8*/libpvrPVR2D_LINUXFBWSEGL.so.*=
"=0A> > >>=A0 RRECOMMENDS_${PN}-linuxfbwsegl =3D " ${PN}-linuxfbwsegl-es2=
=0A> > >${PN}-=0A> > >> linuxfbwsegl-es3 ${PN}-linuxfbwsegl-es5 ${PN}-linux=
fbwsegl-es6=0A> > >> ${PN}-linuxfbwsegl-es8"=0A> > >>=0A> > >> -FILES_${PN}=
-x11wsegl-es2 =3D=0A> > >> "${libdir}/ES2*/libpvrPVR2D_X11WSEGL.so.* ${bind=
ir}/ES2*/x*=0A> > >> ${bindir}/ES2*/*x"=0A> > >> -FILES_${PN}-x11wsegl-es3 =
=3D=0A> > >> "${libdir}/ES3*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES3*/x*=0A=
> > >> ${bindir}/ES3*/*x"=0A> > >> -FILES_${PN}-x11wsegl-es5 =3D=0A> > >> "=
${libdir}/ES5*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES5*/x*=0A> > >> ${bindi=
r}/ES5*/*x"=0A> > >> -FILES_${PN}-x11wsegl-es6 =3D=0A> > >> "${libdir}/ES6*=
/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES6*/x*=0A> > >> ${bindir}/ES6*/*x"=0A=
> > >> -FILES_${PN}-x11wsegl-es8 =3D=0A> > >> "${libdir}/ES8*/libpvrPVR2D_X=
11WSEGL.so.* ${bindir}/ES8*/x*=0A> > >> ${bindir}/ES8*/*x"=0A> > >> -RRECOM=
MENDS_${PN}-x11wsegl =3D " ${PN}-x11wsegl-es2 ${PN}-=0A> > >> x11wsegl-es3 =
${PN}-x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-=0A> > >> x11wsegl-es8"=0A> > >=
> -=0A> > >> -FILES_${PN}-driwsegl-es2 =3D=0A> > >> "${libdir}/ES2*/libpvrP=
VR2D_DRIWSEGL.so.*=0A> > >> ${libdir}/ES2*/libsrv_um_dri*"=0A> > >> -FILES_=
${PN}-driwsegl-es3 =3D=0A> > >> "${libdir}/ES3*/libpvrPVR2D_DRIWSEGL.so.*=
=0A> > >> ${libdir}/ES3*/libsrv_um_dri*"=0A> > >> -FILES_${PN}-driwsegl-es5=
 =3D=0A> > >> "${libdir}/ES5*/libpvrPVR2D_DRIWSEGL.so.*=0A> > >> ${libdir}/=
ES5*/libsrv_um_dri*"=0A> > >> -FILES_${PN}-driwsegl-es6 =3D=0A> > >> "${lib=
dir}/ES6*/libpvrPVR2D_DRIWSEGL.so.*=0A> > >> ${libdir}/ES6*/libsrv_um_dri*"=
=0A> > >> -FILES_${PN}-driwsegl-es8 =3D=0A> > >> "${libdir}/ES8*/libpvrPVR2=
D_DRIWSEGL.so.*=0A> > >> ${libdir}/ES8*/libsrv_um_dri*"=0A> > >> -RRECOMMEN=
DS_${PN}-driwsegl =3D " ${PN}-driwsegl-es2 ${PN}-=0A> > >> driwsegl-es3 ${P=
N}-driwsegl-es5 ${PN}-driwsegl-es6 ${PN}-=0A> > >> driwsegl-es8"=0A> > >> -=
=0A> > >>=A0 CONFFILES_${PN} =3D "${sysconfdir}/powervr.ini"=0A> > >>=0A> >=
 >>=A0 FILES_${PN} =3D "${sysconfdir} ${libdir}/*.so*=0A> > >${bindir}/${PV=
R_INIT}=0A> > >> ${bindir}/cputype ${bindir}/*"=0A> > >>=0A> > >> -FILES_xs=
erver-kdrive-powervrsgx =3D "${bindir}/Xsgx"=0A> > >>=A0 FILES_${PN}-tests =
=3D "${bindir}/*test*"=0A> > >>=A0 FILES_${PN}-dbg =3D "${libdir}/.debug/* =
${bindir}/.debug/* \=0A> > >>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0  ${lib=
dir}/ES*/.debug ${bindir}/*/.debug\ @@=0A> > >> -338,12 +261,8 @@ FILES_${P=
N}-dbg =3D "${libdir}/.debug/*=0A> > >> ${bindir}/.debug/* \=0A> > >>=A0 =
=A0=A0=A0 "=0A> > >>=0A> > >>=A0 FILES_${PN}-rawdemos =3D "${bindir}/SGX/de=
mos/Raw/*"=0A> > >> -FILES_${PN}-x11demos =3D "${bindir}/SGX/demos/X11/*=0A=
> > >> ${prefix}/share/applications "=0A> > >> -RRECOMMENDS_${PN}-x11demos =
=3D "${PN}-x11wsegl"=0A> > >>=0A> > >>=A0 FILES_${PN}-rawtrainingcourses =
=3D=0A> > >> "${bindir}/SGX/trainingcourses/Raw/*"=0A> > >> -FILES_${PN}-x1=
1trainingcourses =3D=0A> > >> "${bindir}/SGX/trainingcourses/X11/*"=0A> > >=
> -RRECOMMENDS_${PN}-x11trainingcourses =3D "${PN}-x11wsegl"=0A> > >>=0A> >=
 >>=A0 # The libs need the kernel-modules=0A> > >>=A0 RRECOMMENDS_${PN} +=
=3D "omap3-sgx-modules"=0A> > >> @@ -358,7 +277,6 @@ INSANE_SKIP_${PN}-es5 =
=3D "ldflags dev-so=0A> > >staticdev"=0A> > >>=A0 INSANE_SKIP_${PN}-es6 =3D=
 "ldflags dev-so staticdev"=0A> > >>=A0 INSANE_SKIP_${PN}-es8 =3D "ldflags =
dev-so staticdev"=0A> > >>=A0 INSANE_SKIP_${PN}-rawdemos =3D "ldflags dev-s=
o useless-rpaths"=0A> > >> -INSANE_SKIP_${PN}-x11demos =3D "ldflags dev-so =
useless-rpaths"=0A> > >>=A0 INSANE_SKIP_${PN}-blitwsegl =3D "ldflags"=0A> >=
 >>=A0 INSANE_SKIP_${PN}-blitwsegl-es3 =3D "ldflags"=0A> > >>=A0 INSANE_SKI=
P_${PN}-blitwsegl-es5 =3D "ldflags"=0A> > >> @@ -379,18 +297,7 @@ INSANE_SK=
IP_${PN}-linuxfbwsegl-es3 =3D=0A> > >"ldflags"=0A> > >>=A0 INSANE_SKIP_${PN=
}-linuxfbwsegl-es5 =3D "ldflags"=0A> > >>=A0 INSANE_SKIP_${PN}-linuxfbwsegl=
-es6 =3D "ldflags"=0A> > >>=A0 INSANE_SKIP_${PN}-linuxfbwsegl-es8 =3D "ldfl=
ags"=0A> > >> -INSANE_SKIP_${PN}-x11wsegl =3D "ldflags dev-so"=0A> > >> -IN=
SANE_SKIP_${PN}-x11wsegl-es3 =3D "ldflags dev-so"=0A> > >> -INSANE_SKIP_${P=
N}-x11wsegl-es5 =3D "ldflags dev-so"=0A> > >> -INSANE_SKIP_${PN}-x11wsegl-e=
s6 =3D "ldflags dev-so"=0A> > >> -INSANE_SKIP_${PN}-x11wsegl-es8 =3D "ldfla=
gs dev-so"=0A> > >> -INSANE_SKIP_${PN}-driwsegl =3D "ldflags dev-so"=0A> > =
>> -INSANE_SKIP_${PN}-driwsegl-es3 =3D "ldflags dev-so"=0A> > >> -INSANE_SK=
IP_${PN}-driwsegl-es5 =3D "ldflags dev-so"=0A> > >> -INSANE_SKIP_${PN}-driw=
segl-es6 =3D "ldflags dev-so"=0A> > >> -INSANE_SKIP_${PN}-driwsegl-es8 =3D =
"ldflags dev-so"=0A> > >>=A0 INSANE_SKIP_${PN}-tests =3D "ldflags"=0A> > >>=
 -INSANE_SKIP_xserver-kdrive-powervrsgx =3D "ldflags"=0A> > >>=0A> > >>=A0 =
# Quality control is really poor on these SDKs, so hack around=0A> > >the=
=0A> > >> latest madness:=0A> > >>=A0 FILES_${PN} +=3D "${libdir}/*.so "=0A=
> > >> @@ -404,12 +311,6 @@ INITSCRIPT_PARAMS =3D "start 30 5 2 . stop 40=
=0A> > >> 0 1 6 ."=0A> > >>=A0 # Append to update-rc.d postinst=0A> > >>=A0=
 pkg_postinst_${PN}_append() {=0A> > >>=A0 rm -f $D${sysconfdir}/powervr-es=
rev=0A> > >> -=0A> > >> -if [ ${SUPPORT_XORG} -eq 1 ] ; then=0A> > >> -=A0=
=A0=A0 ln -sf /usr/lib/libXdmcp.so.6.0.0 /usr/lib/libXdmcp.so.0=0A> > >> -=
=A0=A0=A0 ln -sf /usr/lib/libXau.so.6.0.0 /usr/lib/libXau.so.0=0A> > >> -fi=
=0A> > >> -=0A> > >>=A0 }=0A> > >>=0A> > >>=A0 pkg_postinst_${PN}-blitwsegl=
() {=0A> > >> @@ -427,14 +328,3 @@ pkg_postinst_${PN}-linuxfbwsegl() {=A0 r=
m -f=0A> > >> $D${sysconfdir}/powervr-esrev=A0 }=0A> > >>=0A> > >> -pkg_pos=
tinst_${PN}-x11wsegl() {=0A> > >> -rm -f $D${sysconfdir}/powervr-esrev=0A> =
> >> -=0A> > >> -echo "[default]" > $D${sysconfdir}/powervr.ini -echo=0A> >=
 >> "WindowSystem=3DlibpvrPVR2D_X11WSEGL.so.1" >>=0A> > >> $D${sysconfdir}/=
powervr.ini -}=0A> > >> -=0A> > >> -pkg_postinst_${PN}-driwsegl() {=0A> > >=
> -rm -f $D${sysconfdir}/powervr-esrev=0A> > >> -}=0A> > >> -=0A> > >> diff=
 --git a/recipes-graphics/libgles/libgles-=0A> > >omap3_4.09.00.01.bb=0A> >=
 >> b/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb=0A> > >> index 7=
c6f231..165a406 100644=0A> > >> --- a/recipes-graphics/libgles/libgles-omap=
3_4.09.00.01.bb=0A> > >> +++ b/recipes-graphics/libgles/libgles-omap3_4.09.=
00.01.bb=0A> > >> @@ -23,8 +23,6 @@ TI_BIN_UNPK_WDEXT :=3D "/Graphics_SDK_$=
{SGXPV}"=0A> > >>=A0 SRC_URI =3D "http://software-=0A> > >>=0A> > >dl.ti.co=
m/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV=0A> > >> }/export=
s/${BINFILE} \=0A> > >>=A0 =A0 =A0 =A0 =A0 =A0  file://cputype \=0A> > >>=
=A0 =A0 =A0 =A0 =A0 =A0  file://rc.pvr \=0A> > >> -=A0 =A0 =A0 =A0 =A0  fil=
e://rc_dri.pvr \=0A> > >> -=A0 =A0 =A0 =A0 =A0  file://sample.desktop \=0A>=
 > >>=A0 =A0 =A0 =A0 =A0 =A0  file://99-bufferclass.rules=A0 \=A0 "=0A> > >=
>=A0 SRC_URI[md5sum] =3D "bd35e9d8843aff3a2aca9d41e7db1c7d"=0A> > >> @@ -32=
,44 +30,5 @@ SRC_URI[sha256sum] =3D=0A> > >> "eb37f75ddde4640b09e760fa86e68=
9beb394330ecdf68786188c34f249=0A> > >>=0A> > >>=A0 S =3D "${WORKDIR}/Graphi=
cs_SDK_${SGXPV}"=0A> > >>=0A> > >> -LIBGLESWINDOWSYSTEM ?=3D "${@base_conta=
ins('DISTRO_FEATURES',=0A> > >> 'x11',"libpvrPVR2D_DRIWSEGL.so" ,"libpvrPVR=
2D_FRONTWSEGL.so.1",=0A> > >d)}"=0A> > >> +LIBGLESWINDOWSYSTEM ?=3D "libpvr=
PVR2D_FRONTWSEGL.so.1"=0A> > >>=0A> > >> -do_configure_append() {=0A> > >> =
-=0A> > >> -=A0 =A0 # Change PVR server's user mode library to point to DRI=
=0A> > >> -=A0 =A0 for drifile in $(find ${S} -name "libsrv_um_dri.so"); do=
=0A> > >> -=A0 =A0 if [ "$drifile" !=3D "" ]=0A> > >> -=A0 =A0 then=0A> > >=
> -=A0 =A0 =A0 =A0 dir=3D$(dirname ${drifile})=0A> > >> -=A0 =A0 =A0 =A0 if=
 [ "$SUPPORT_XORG" =3D "1" ]=0A> > >> -=A0 =A0 =A0 =A0 then=0A> > >> -=A0 =
=A0 =A0 =A0 =A0 =A0 mv ${dir}/libsrv_um_dri.so ${dir}/libsrv_um.so=0A> > >>=
 -=A0 =A0 =A0 =A0 else=0A> > >> -=A0 =A0 =A0 =A0 =A0 =A0 rm -rf ${dir}/libs=
rv_um_dri.so=0A> > >> -=A0 =A0 =A0 =A0 fi=0A> > >> -=A0 =A0 fi=0A> > >> -=
=0A> > >> -=A0 =A0 done=0A> > >> -}=0A> > >> -=0A> > >> -do_install_append(=
) {=0A> > >> -=0A> > >> -=A0 =A0 # In this version of the graphics SDK the =
following=0A> > >> directories do not exist:=0A> > >> -=A0 =A0 #=0A> > >> /=
GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/pvr2d.h=0A> > >> (doesn=
't exist)=0A> > >> -=A0 =A0 #=0A> > >>=0A> > >/GFX_Linux_SDK/OGLES/SDKPacka=
ge/Builds/OGLES/Include/GLES/egltype=0A> > >> s.h (doesn't exist)=0A> > >> =
-=A0 =A0 # Therefore, need to copy these files manually at the only=0A> > >=
> location that they do exist=0A> > >> -=A0 =A0 cp -pPr ${S}/include/pvr2d/=
*.h ${D}${includedir}=0A> > >> -=A0 =A0 cp -pPr ${S}/include/OGLES/GLES ${D=
}${includedir}/=0A> > >> -=0A> > >> -=A0 =A0 rm ${D}${sysconfdir}/init.d/pv=
r-init=0A> > >> -=0A> > >> -=A0 =A0 if [ "$SUPPORT_XORG" =3D "1" ]; then=0A=
> > >> -=A0 =A0 =A0 =A0 cp -pP ${WORKDIR}/rc_dri.pvr=0A> > >> ${D}${sysconf=
dir}/init.d/pvr-init=0A> > >> -=A0 =A0 else=0A> > >> -=A0 =A0 =A0 =A0 cp -p=
P ${WORKDIR}/rc.pvr ${D}${sysconfdir}/init.d/pvr-=0A> > >> init=0A> > >> -=
=A0 =A0 fi=0A> > >> -=0A> > >> -}=0A> > >> -=0A> > >> -RRECOMMENDS_${PN}-x1=
1demos =3D "${PN}-driwsegl"=0A> > >> -RRECOMMENDS_${PN}-x11trainingcourses =
=3D "${PN}-driwsegl"=0A> > >> --=0A> > >> 1.7.1=0A> > >>=0A> > >> _________=
______________________________________=0A> > >> meta-ti mailing list=0A> > =
>> meta-ti@yoctoproject.org=0A> > >> https://lists.yoctoproject.org/listinf=
o/meta-ti=0A> > _______________________________________________=0A> > meta-=
ti mailing list=0A> > meta-ti@yoctoproject.org=0A> > https://lists.yoctopro=
ject.org/listinfo/meta-ti=0A> > =0A> ______________________________________=
_________=0A> meta-ti mailing list=0A> meta-ti@yoctoproject.org=0A> https:/=
/lists.yoctoproject.org/listinfo/meta-ti=0A________________________________=
_______________=0Ameta-ti mailing list=0Ameta-ti@yoctoproject.org=0Ahttps:/=
/lists.yoctoproject.org/listinfo/meta-ti=0A________________________________=
_______________=0Ameta-ti mailing list=0Ameta-ti@yoctoproject.org=0Ahttps:/=
/lists.yoctoproject.org/listinfo/meta-ti

---1981468715-1279370570-1368810135=:92464
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"color:#000; background-color:#fff; font-family:ar=
ial, helvetica, sans-serif;font-size:12pt">Chase, Denys,<br><br>I have resu=
bmitted the patches with comments incorporated. RPROVIDES clarification is =
pending so still keeping as it was. Please review,<br><div><span><br></span=
></div><div>regards</div><div>Prabu<br></div>  <div style=3D"font-family: a=
rial, helvetica, sans-serif; font-size: 12pt;"> <div style=3D"font-family: =
times new roman, new york, times, serif; font-size: 12pt;"> <div dir=3D"ltr=
"> <hr size=3D"1">  <font face=3D"Arial" size=3D"2"> <b><span style=3D"font=
-weight:bold;">From:</span></b> "Sundareson, Prabindh" &lt;prabu@ti.com&gt;=
<br> <b><span style=3D"font-weight: bold;">To:</span></b> "Dmytriyenko, Den=
ys" &lt;denys@ti.com&gt;; "Maupin, Chase" &lt;chase.maupin@ti.com&gt; <br><=
b><span style=3D"font-weight: bold;">Cc:</span></b> "meta-ti@yoctoproject.o=
rg" &lt;meta-ti@yoctoproject.org&gt; <br> <b><span style=3D"font-weight:
 bold;">Sent:</span></b> Wednesday, May 15, 2013 8:18 AM<br> <b><span style=
=3D"font-weight: bold;">Subject:</span></b> Re: [meta-ti] [PATCH 01/10] lib=
gles-omap3: Remove X11 related build=0A and=09packaging<br> </font> </div> =
<div class=3D"y_msg_container"><br>Denys,<br><br>Thanks for the review. I w=
ill resubmit the patch-set for review - with below comments implemented. <b=
r><br>regards,<br>Prabu<br><br><br>-----Original Message-----<br>From: <a y=
mailto=3D"mailto:meta-ti-bounces@yoctoproject.org" href=3D"mailto:meta-ti-b=
ounces@yoctoproject.org">meta-ti-bounces@yoctoproject.org</a> [mailto:<a ym=
ailto=3D"mailto:meta-ti-bounces@yoctoproject.org" href=3D"mailto:meta-ti-bo=
unces@yoctoproject.org">meta-ti-bounces@yoctoproject.org</a>] On Behalf Of =
Dmytriyenko, Denys<br>Sent: Tuesday, May 14, 2013 11:17 PM<br>To: Maupin, C=
hase<br>Cc: <a ymailto=3D"mailto:meta-ti@yoctoproject.org" href=3D"mailto:m=
eta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br>Subject: Re: [meta=
-ti] [PATCH 01/10] libgles-omap3: Remove X11 related build and packaging<br=
><br>Prabu,<br><br>I don't think I have any more comments, than for 01, 06 =
and 08. Will you be re-submitting the entire set
 later? I'll go ahead and remove this set from my queue as it will be "supe=
rseded". Thanks!<br><br>--<br>Denys<br><br><br>On Tue, May 14, 2013 at 01:2=
3:16PM -0400, Denys Dmytriyenko wrote:<br>&gt; On Fri, May 10, 2013 at 01:2=
7:09PM +0000, Maupin, Chase wrote:<br>&gt; &gt; <br>&gt; &gt; &gt;-----Orig=
inal Message-----<br>&gt; &gt; &gt;From: Sundareson, Prabindh<br>&gt; &gt; =
&gt;Sent: Friday, May 10, 2013 4:17 AM<br>&gt; &gt; &gt;To: Maupin, Chase; =
<a ymailto=3D"mailto:meta-ti@yoctoproject.org" href=3D"mailto:meta-ti@yocto=
project.org">meta-ti@yoctoproject.org</a><br>&gt; &gt; &gt;Subject: RE: [me=
ta-ti] [PATCH 01/10] libgles-omap3: Remove X11<br>&gt; &gt; &gt;related bui=
ld and packaging<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;Chase, thanks for the r=
eview,<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;1) Ok, I will add it. By "later r=
ecipe", you mean the separated<br>&gt; &gt; &gt;x11 recipe, right ?<br>&gt;=
 &gt; <br>&gt; &gt; Yes sir<br>&gt; &gt; <br>&gt; &gt; &gt;<br>&gt; &gt;
 &gt;2) Good point - I am ok to leave the old .inc and create a new one<br>=
&gt; &gt; &gt;with the changes starting from 4.09 then. Is this ok ?<br>&gt=
; &gt; <br>&gt; &gt; I'm OK with the approach.&nbsp; Denys, any concern her=
e?<br>&gt; <br>&gt; Sounds good - there are still some users of 4.08 out th=
ere...<br>&gt; <br>&gt; <br>&gt; &gt; &gt;regards,<br>&gt; &gt; &gt;Prabu<b=
r>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;-----Original Message--=
---<br>&gt; &gt; &gt;From: Maupin, Chase<br>&gt; &gt; &gt;Sent: Wednesday, =
May 08, 2013 6:48 PM<br>&gt; &gt; &gt;To: Sundareson, Prabindh; <a ymailto=
=3D"mailto:meta-ti@yoctoproject.org" href=3D"mailto:meta-ti@yoctoproject.or=
g">meta-ti@yoctoproject.org</a><br>&gt; &gt; &gt;Subject: RE: [meta-ti] [PA=
TCH 01/10] libgles-omap3: Remove X11<br>&gt; &gt; &gt;related build and pac=
kaging<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;Prabu,<br>&gt; &gt; &gt;<br>&gt; =
&gt; &gt;Overall nice job.&nbsp; A couple of things I noticed.<br>&gt;
 &gt; &gt;<br>&gt; &gt; &gt;1. You removed the sample.desktop file but did =
not put it back in<br>&gt; &gt; &gt;a later recipe.<br>&gt; &gt; &gt;2. You=
 modified the common .inc file and then added the X11 pieces<br>&gt; &gt; &=
gt;back for 4.09.00.01.&nbsp; This would break people using the older<br>&g=
t; &gt; &gt;recipes though.&nbsp; So would it perhaps be a good idea to lea=
ve the<br>&gt; &gt; &gt;.inc alone and then create a new include file for n=
ewer recipe<br>&gt; &gt; &gt;that do this split going forward?&nbsp; Or wou=
ld it be simpler to<br>&gt; &gt; &gt;provide the X11 package for the older =
versions as well?&nbsp; This is<br>&gt; &gt; &gt;just a thought and I'm hop=
ing others will chime in here.<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;Thanks fo=
r the patches, it is really good to see this work being<br>&gt; &gt; &gt;do=
ne :)<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;&gt; -----Original Message-----<br=
>&gt; &gt; &gt;&gt; From: <a
 ymailto=3D"mailto:meta-ti-bounces@yoctoproject.org" href=3D"mailto:meta-ti=
-bounces@yoctoproject.org">meta-ti-bounces@yoctoproject.org</a> [mailto:met=
a-ti-<br>&gt; &gt; &gt;&gt; <a ymailto=3D"mailto:bounces@yoctoproject.org" =
href=3D"mailto:bounces@yoctoproject.org">bounces@yoctoproject.org</a>] On B=
ehalf Of Sundareson, Prabindh<br>&gt; &gt; &gt;&gt; Sent: Thursday, May 02,=
 2013 8:39 AM<br>&gt; &gt; &gt;&gt; To: <a ymailto=3D"mailto:meta-ti@yoctop=
roject.org" href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.o=
rg</a><br>&gt; &gt; &gt;&gt; Subject: [meta-ti] [PATCH 01/10] libgles-omap3=
: Remove X11<br>&gt; &gt; &gt;related<br>&gt; &gt; &gt;&gt; build and packa=
ging<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt; The SGX530 driver for X11 =
is only buildable and testable<br>&gt; &gt; &gt;standalone<br>&gt; &gt; &gt=
;&gt; with the pre-built X11 package provided with the Graphics SDK.<br>&gt=
; &gt; &gt;&gt; This patch removes X11 build from the default recipe, to
 enable<br>&gt; &gt; &gt;moving<br>&gt; &gt; &gt;&gt; X11 build to a separa=
te recipe.<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt; This is part of a cl=
ean up of the Graphics recipe starting from<br>&gt; &gt; &gt;&gt; 4.09.00.0=
1 version of the Graphics SDK.<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt; =
Signed-off-by: Prabindh Sundareson &lt;<a ymailto=3D"mailto:prabu@ti.com" h=
ref=3D"mailto:prabu@ti.com">prabu@ti.com</a>&gt;<br>&gt; &gt; &gt;&gt; ---<=
br>&gt; &gt; &gt;&gt;&nbsp; recipes-graphics/libgles/libgles-omap3.inc&nbsp=
; &nbsp; &nbsp; &nbsp;  |&nbsp; 168 ++++-<br>&gt; &gt; &gt;-<br>&gt; &gt; &=
gt;&gt; --------------<br>&gt; &gt; &gt;&gt;&nbsp; .../libgles/libgles-omap=
3_4.09.00.01.bb&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp;  43 +----<=
br>&gt; &gt; &gt;-<br>&gt; &gt; &gt;&gt;&nbsp; 2 files changed, 30 insertio=
ns(+), 181 deletions(-)<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt; diff --=
git a/recipes-graphics/libgles/libgles-omap3.inc<br>&gt; &gt; &gt;&gt;
 b/recipes-graphics/libgles/libgles-omap3.inc<br>&gt; &gt; &gt;&gt; index 9=
a90c56..130dc49 100644<br>&gt; &gt; &gt;&gt; --- a/recipes-graphics/libgles=
/libgles-omap3.inc<br>&gt; &gt; &gt;&gt; +++ b/recipes-graphics/libgles/lib=
gles-omap3.inc<br>&gt; &gt; &gt;&gt; @@ -7,10 +7,6 @@ PR =3D "r35"<br>&gt; =
&gt; &gt;&gt;<br>&gt; &gt; &gt;&gt;&nbsp; COMPATIBLE_MACHINE =3D "(omap3|ti=
814x|ti816x|ti33x)"<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt; -X11DEPENDS=
 =3D "virtual/libx11 libxau libxdmcp libdrm"<br>&gt; &gt; &gt;&gt; -DEPENDS=
 =3D "${@base_contains('DISTRO_FEATURES', 'x11',<br>&gt; &gt; &gt;&gt; '${X=
11DEPENDS}', '', d)}"<br>&gt; &gt; &gt;&gt; -<br>&gt; &gt; &gt;&gt; -export=
 SUPPORT_XORG ?=3D "${@base_contains('DISTRO_FEATURES',<br>&gt; &gt; &gt;&g=
t; 'x11', '1', '0', d)}"<br>&gt; &gt; &gt;&gt;&nbsp; PVR_INIT ?=3D "pvrsrvi=
nit"<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt;&nbsp; PROVIDES +=3D "virtu=
al/egl virtual/libgles1 virtual/libgles2"<br>&gt; &gt; &gt;&gt; @@ -22,7 +1=
8,6 @@
 RREPLACES_${PN}-dbg =3D "libegl-dbg"<br>&gt; &gt; &gt;&gt;&nbsp; SRC_URI =
=3D "<a href=3D"http://software-/" target=3D"_blank">http://software-</a><b=
r>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;dl.ti.com/dsps/dsps_public_sw/sdo_sb/=
targetcontent/gfxsdk/${SGXPV<br>&gt; &gt; &gt;&gt; }/exports/${BINFILE} \<b=
r>&gt; &gt; &gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;  fi=
le://cputype \<br>&gt; &gt; &gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&=
nbsp; &nbsp;  file://rc.pvr \<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; &nb=
sp;&nbsp;&nbsp; &nbsp;  file://sample.desktop \<br>&gt; &gt; &gt;&gt;&nbsp;=
 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;  file://99-bufferclass.rules&=
nbsp; \<br>&gt; &gt; &gt;&gt;&nbsp; "<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &g=
t;&gt; @@ -79,87 +74,53 @@ do_compile() {<br>&gt; &gt; &gt;&gt;&nbsp; &nbsp=
;&nbsp;&nbsp; export PLAT_CPP=3D"${CXX}"<br>&gt; &gt; &gt;&gt;&nbsp; &nbsp;=
&nbsp;&nbsp; export PLAR_AR=3D"${AR}"<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &g=
t;&gt;
 -&nbsp;&nbsp;&nbsp; if [ ${SUPPORT_XORG} -eq 1 ] ; then<br>&gt; &gt; &gt;&=
gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; export X11ROOT=3D"${STAGING_DIR_=
HOST}/usr"<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; mkd=
ir -p ${S}/demos/x11<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;=
&nbsp; mkdir -p ${S}/trainingcourses/x11<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp=
;&nbsp; fi<br>&gt; &gt; &gt;&gt; -<br>&gt; &gt; &gt;&gt;&nbsp; &nbsp;&nbsp;=
&nbsp; mkdir -p ${S}/demos/raw<br>&gt; &gt; &gt;&gt;&nbsp; &nbsp;&nbsp;&nbs=
p; mkdir -p ${S}/trainingcourses/raw<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt=
;&gt;&nbsp; &nbsp;&nbsp;&nbsp; # Rebuild demos<br>&gt; &gt; &gt;&gt; -&nbsp=
;&nbsp;&nbsp; for X11BUILD in 0 1 ; do<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&=
nbsp; &nbsp;&nbsp;&nbsp; # Don't rebuild demos with X11 support for a non X=
11<br>&gt; &gt; &gt;&gt; distro<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; &=
nbsp;&nbsp;&nbsp; if [ ${SUPPORT_XORG} -eq 0 -a $X11BUILD -eq 1 ]
 ;<br>&gt; &gt; &gt;&gt; then<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; &nb=
sp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; continue<br>&gt; &gt; &gt;&gt; -&nbsp;&n=
bsp;&nbsp; &nbsp;&nbsp;&nbsp; fi<br>&gt; &gt; &gt;&gt; +&nbsp;&nbsp;&nbsp; =
for demo in ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Demos/* ;<br>&gt; &gt; &gt;=
&gt; do<br>&gt; &gt; &gt;&gt; +&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; cd $de=
mo/OGLES/Build/LinuxGeneric<br>&gt; &gt; &gt;&gt; +&nbsp;&nbsp;&nbsp; &nbsp=
;&nbsp;&nbsp; oe_runmake Common=3D1 PLATFORM=3D${PLATFORM} X11BUILD=3D0<br>=
&gt; &gt; &gt;&gt; +&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; rm $demo/OGLES/Bu=
ild/${PLATFORM}/Release*/*.o<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; =
+&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install -m 0755<br>&gt; &gt; &gt;&gt=
; $demo/OGLES/Build/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw ||<br>&gt; &gt;=
 &gt;true<br>&gt; &gt; &gt;&gt; +&nbsp;&nbsp;&nbsp; done<br>&gt; &gt; &gt;&=
gt; +<br>&gt; &gt; &gt;&gt; +&nbsp;&nbsp;&nbsp; for demo in
 ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Demos/* ;<br>&gt; &gt; &gt;&gt; do<br=
>&gt; &gt; &gt;&gt; +&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; cd $demo/OGLES2/=
Build/LinuxGeneric<br>&gt; &gt; &gt;&gt; +&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&n=
bsp; oe_runmake Common=3D1 PLATFORM=3D${PLATFORM} X11BUILD=3D0<br>&gt; &gt;=
 &gt;&gt; +&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; rm -f $demo/OGLES2/Build/$=
{PLATFORM}/Release*/*.o<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt; -&nbsp;=
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; for demo in<br>&gt; &gt; &gt;&gt; ${S}/GFX_=
Linux_SDK/OGLES/SDKPackage/Demos/* ; do<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;=
&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; cd $demo/OGLES/Build/LinuxGene=
ric<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbs=
p;&nbsp; oe_runmake Common=3D1 PLATFORM=3D${PLATFORM}<br>&gt; &gt; &gt;&gt;=
 X11BUILD=3D$X11BUILD<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp=
;&nbsp; &nbsp;&nbsp;&nbsp; rm $demo/OGLES/Build/${PLATFORM}/Release*/*.o<br=
>&gt;
 &gt; &gt;&gt; -<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbs=
p; &nbsp;&nbsp;&nbsp; if [ $X11BUILD -eq 1 ] ; then<br>&gt; &gt; &gt;&gt; -=
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=
 install -m 0755<br>&gt; &gt; &gt;&gt; $demo/OGLES/Build/${PLATFORM}/Releas=
eX11/* ${S}/demos/x11 ||<br>&gt; &gt; &gt;true<br>&gt; &gt; &gt;&gt; -&nbsp=
;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; sed =
-e s:NAME:$(basename $demo): \<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; &n=
bsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; -e<br>=
&gt; &gt; &gt;&gt; s:EXEC:${bindir}/SGX/demos/X11/$(basename<br>&gt; &gt; &=
gt;&gt; $demo/OGLES/Build/${PLATFORM}/ReleaseX11/*): \<br>&gt; &gt; &gt;&gt=
; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nb=
sp; &nbsp; &nbsp; ${WORKDIR}/sample.desktop &gt;<br>&gt; &gt; &gt;&gt; ${WO=
RKDIR}/$(basename $demo).desktop<br>&gt; &gt; &gt;&gt;
 -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; else<br>&gt; &gt=
; &gt;&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;=
&nbsp;&nbsp; install -m 0755<br>&gt; &gt; &gt;&gt; $demo/OGLES/Build/${PLAT=
FORM}/ReleaseRaw/* ${S}/demos/raw ||<br>&gt; &gt; &gt;true<br>&gt; &gt; &gt=
;&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; fi<br>&gt; =
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; done<br>&gt; &gt; &gt;=
&gt; -<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; for dem=
o in<br>&gt; &gt; &gt;&gt; ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Demos/* ; d=
o<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;=
&nbsp; cd $demo/OGLES2/Build/LinuxGeneric<br>&gt; &gt; &gt;&gt; -&nbsp;&nbs=
p;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; oe_runmake Common=3D1 PLATFO=
RM=3D${PLATFORM}<br>&gt; &gt; &gt;&gt; X11BUILD=3D$X11BUILD<br>&gt; &gt; &g=
t;&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; rm
 -f<br>&gt; &gt; &gt;&gt; $demo/OGLES2/Build/${PLATFORM}/Release*/*.o<br>&g=
t; &gt; &gt;&gt; -<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&n=
bsp; &nbsp;&nbsp;&nbsp; if [ $X11BUILD -eq 1 ] ; then<br>&gt; &gt; &gt;&gt;=
 -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbs=
p; install -m 0755<br>&gt; &gt; &gt;&gt; $demo/OGLES2/Build/${PLATFORM}/Rel=
easeX11/* ${S}/demos/x11 ||<br>&gt; &gt; &gt;true<br>&gt; &gt; &gt;&gt; -&n=
bsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; s=
ed -e s:NAME:$(basename $demo): \<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;=
 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; -e<=
br>&gt; &gt; &gt;&gt; s:EXEC:${bindir}/SGX/demos/X11/$(basename<br>&gt; &gt=
; &gt;&gt; $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/*): \<br>&gt; &gt; &gt=
;&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp=
;&nbsp; &nbsp; &nbsp; ${WORKDIR}/sample.desktop &gt;<br>&gt; &gt;
 &gt;&gt; ${WORKDIR}/$(basename $demo).desktop<br>&gt; &gt; &gt;&gt; -&nbsp=
;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; else<br>&gt; &gt; &gt;&=
gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&=
nbsp; install -m 0755<br>&gt; &gt; &gt;&gt; $demo/OGLES2/Build/${PLATFORM}/=
ReleaseRaw/* ${S}/demos/raw ||<br>&gt; &gt; &gt;true<br>&gt; &gt; &gt;&gt; =
-&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; fi<br>&gt; &gt; &=
gt;&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; done<br>&gt; &gt; &gt;&gt; +=
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install -m 0755<br>&gt; &gt; &gt;&gt;=
 $demo/OGLES2/Build/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw ||<br>&gt; &gt;=
 &gt;true<br>&gt; &gt; &gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp; done<br>&gt; &gt; =
&gt;&gt;<br>&gt; &gt; &gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp; find ${S} -name "*_=
org" -delete<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt;&nbsp; &nbsp;&nbsp;=
&nbsp; # Build OGLES2 Trainingcourses<br>&gt; &gt; &gt;&gt;
 -&nbsp;&nbsp;&nbsp; for X11BUILD in 0 1 ; do<br>&gt; &gt; &gt;&gt; -&nbsp;=
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; # Don't rebuild training courses with X11 s=
upport for<br>&gt; &gt; &gt;&gt; a non X11 distro<br>&gt; &gt; &gt;&gt; -&n=
bsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; if [ ${SUPPORT_XORG} -eq 0 -a $X11BUILD=
 -eq 1 ] ;<br>&gt; &gt; &gt;&gt; then<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&n=
bsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; continue<br>&gt; &gt; &gt;&gt; +=
&nbsp;&nbsp;&nbsp; for training in<br>&gt; &gt; &gt;&gt; ${S}/GFX_Linux_SDK=
/OGLES2/SDKPackage/TrainingCourse/* ; do<br>&gt; &gt; &gt;&gt; +&nbsp;&nbsp=
;&nbsp; &nbsp;&nbsp;&nbsp; if [ -e $training/OGLES2/Build/LinuxGeneric/Make=
file<br>&gt; &gt; &gt;&gt; ] ; then<br>&gt; &gt; &gt;&gt; +&nbsp;&nbsp;&nbs=
p; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; cd $training/OGLES2/Build/LinuxGen=
eric<br>&gt; &gt; &gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; fi<b=
r>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp; for training in<br>&gt; &gt; &gt;&gt; ${S}/GFX_Linux_SD=
K/OGLES2/SDKPackage/TrainingCourse/* ; do<br>&gt; &gt; &gt;&gt; -&nbsp;&nbs=
p;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; if [ -e<br>&gt; &gt; &gt;&gt=
; $training/OGLES2/Build/LinuxGeneric/Makefile ] ; then<br>&gt; &gt; &gt;&g=
t; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&n=
bsp; cd $training/OGLES2/Build/LinuxGeneric<br>&gt; &gt; &gt;&gt; -&nbsp;&n=
bsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; fi<br>&gt; &gt; &gt;&gt; -=
<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&=
nbsp; if [ -e<br>&gt; &gt; &gt;&gt; $training/OGLES2/Build/${PLATFORM}/Make=
file ] ; then<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; cd $training/OGLES2/Build/${PLATFORM}=
<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&=
nbsp; fi<br>&gt; &gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp; if [ -e $training/OGLES2/Build/${PLATFORM}/Makefile ]<b=
r>&gt; &gt; &gt;&gt; ; then<br>&gt; &gt; &gt;&gt; +&nbsp;&nbsp;&nbsp; &nbsp=
;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; cd $training/OGLES2/Build/${PLATFORM}<br>&=
gt; &gt; &gt;&gt; +&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; fi<br>&gt; &gt; &g=
t;&gt;<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&=
nbsp;&nbsp; oe_runmake Common=3D1 PLATFORM=3D${PLATFORM}<br>&gt; &gt; &gt;&=
gt; X11BUILD=3D$X11BUILD<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&n=
bsp;&nbsp; &nbsp;&nbsp;&nbsp; rm -f<br>&gt; &gt; &gt;&gt; $training/OGLES2/=
Build/${PLATFORM}/Release*/*.o<br>&gt; &gt; &gt;&gt; +&nbsp;&nbsp;&nbsp; &n=
bsp;&nbsp;&nbsp; oe_runmake Common=3D1 PLATFORM=3D${PLATFORM} X11BUILD=3D0<=
br>&gt; &gt; &gt;&gt; +&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; rm -f $trainin=
g/OGLES2/Build/${PLATFORM}/Release*/*.o<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; =
&gt;&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; if [
 $X11BUILD -eq 1 ] ; then<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&=
nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install -m 0755<br>&gt; &=
gt; &gt;&gt; $training/OGLES2/Build/${PLATFORM}/ReleaseX11/*<br>&gt; &gt; &=
gt;&gt; ${S}/trainingcourses/x11 || true<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp=
;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; else<br>&gt; &gt; &gt;&gt; -&=
nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
install -m 0755<br>&gt; &gt; &gt;&gt; $training/OGLES2/Build/${PLATFORM}/Re=
leaseRaw/*<br>&gt; &gt; &gt;&gt; ${S}/trainingcourses/raw || true<br>&gt; &=
gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; fi<b=
r>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; done<br>&gt; &g=
t; &gt;&gt; +&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install -m 0755<br>&gt; =
&gt; &gt;&gt; $training/OGLES2/Build/${PLATFORM}/ReleaseRaw/*<br>&gt; &gt; =
&gt;&gt; ${S}/trainingcourses/raw || true<br>&gt; &gt;
 &gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp; done<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; =
&gt;&gt; +<br>&gt; &gt; &gt;&gt;&nbsp; }<br>&gt; &gt; &gt;&gt;<br>&gt; &gt;=
 &gt;&gt;&nbsp; do_install () {<br>&gt; &gt; &gt;&gt;&nbsp; &nbsp;&nbsp;&nb=
sp; install -d ${D}${libdir}<br>&gt; &gt; &gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;=
 cp -pPR ${BINLOCATION}/*.so* ${D}${libdir}<br>&gt; &gt; &gt;&gt; + &nbsp;&=
nbsp;&nbsp; rm ${D}${libdir}/libpvrPVR2D_DRIWSEGL.so*<br>&gt; &gt; &gt;&gt;=
 + &nbsp;&nbsp;&nbsp; rm ${D}${libdir}/libsrv_um_dri.so*<br>&gt; &gt; &gt;&=
gt; + &nbsp;&nbsp;&nbsp; rm ${D}${libdir}/pvr_drv.so*<br>&gt; &gt; &gt;&gt;=
&nbsp; &nbsp;&nbsp;&nbsp; install -m 0644 ${BINLOCATION}/*.a ${D}${libdir}<=
br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp; instal=
l -d ${D}${bindir}/<br>&gt; &gt; &gt;&gt; @@ -169,12 +130,6 @@ do_install (=
) {<br>&gt; &gt; &gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp; install -m 0755 ${BINLOC=
ATION}/gl* ${D}${bindir}/<br>&gt; &gt; &gt;&gt;&nbsp;
 &nbsp;&nbsp;&nbsp; install -m 0755 ${BINLOCATION}/${PVR_INIT} ${D}${bindir=
}/<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; if [ ${S=
UPPORT_XORG} -eq 1 ] ; then<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; &nbsp=
;&nbsp;&nbsp; install -m 0755 ${BINLOCATION}/xgles1test1<br>&gt; &gt; &gt;&=
gt; ${D}${bindir}/<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&n=
bsp; install -m 0755<br>&gt; &gt; &gt;&gt; ${BINLOCATION}/freedesktop/kdriv=
e/usr/X11R6_SGX/bin/Xsgx<br>&gt; &gt; &gt;&gt; ${D}${bindir}/|| true<br>&gt=
; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; cp -pPR<br>&gt; &gt;=
 &gt;&gt;<br>&gt; &gt; &gt;${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLE=
S2/${PLATFORM}/li<br>&gt; &gt; &gt;&gt; b/*X11WS* ${D}${libdir} || true<br>=
&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; fi<br>&gt; &gt; &gt;&gt; -<br>&gt; &=
gt; &gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp; install -d ${D}${includedir}<br>&gt; =
&gt; &gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp; cp -pPR
 ${S}/GFX_Linux_KM/include4 ${D}${includedir}/<br>&gt; &gt; &gt;&gt;&nbsp; =
&nbsp;&nbsp;&nbsp; cp -pPR ${S}/GFX_Linux_KM/services4 ${D}${includedir}/ @=
@ -<br>&gt; &gt; &gt;211,13<br>&gt; &gt; &gt;&gt; +166,12 @@ do_install () =
{<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp; shar=
ed_prog=3D"eglinfo pvr2d_test ${PVR_INIT} services_test<br>&gt; &gt; &gt;&g=
t; sgx_blit_test sgx_clipblit_test sgx_flip_test sgx_init_test<br>&gt; &gt;=
 &gt;&gt; sgx_render_flip_test"<br>&gt; &gt; &gt;&gt;&nbsp; &nbsp;&nbsp;&nb=
sp; raw_prog=3D"gles1test1 gles2test1 ovg_unit_test"<br>&gt; &gt; &gt;&gt; =
-&nbsp;&nbsp;&nbsp; x11_prog=3D"eglinfo_x xgles1test1 xgles2test1 xmultiegl=
test<br>&gt; &gt; &gt;&gt; xovg_unit_test"<br>&gt; &gt; &gt;&gt;<br>&gt; &g=
t; &gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp; for esrev in 2 3 5 6 8 ; do<br>&gt; &g=
t; &gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ESLOCATION=3D$(eval=
 echo $(echo<br>&gt; &gt; &gt;&gt; \$\{ES${esrev}LOCATION\}))<br>&gt; &gt;
 &gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; if [ -e ${ESLOCATION}=
 ] ; then<br>&gt; &gt; &gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=
 &nbsp;&nbsp;&nbsp; cp -pPR ${ESLOCATION}/lib*${IMGPV}<br>&gt; &gt; &gt;${E=
SLOCATION}/pvr_drv.so<br>&gt; &gt; &gt;&gt; ${ESLOCATION}/*.a ${D}${libdir}=
/ES${esrev}.0/<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=
 &nbsp;&nbsp;&nbsp; for esprog in $shared_prog $raw_prog<br>&gt; &gt; &gt;&=
gt; ${@base_contains('DISTRO_FEATURES', 'x11',"$x11_prog","",d)} ;<br>&gt; =
&gt; &gt;do<br>&gt; &gt; &gt;&gt; +&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &n=
bsp;&nbsp;&nbsp; for esprog in $shared_prog $raw_prog ; do<br>&gt; &gt; &gt=
;&gt;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;=
&nbsp;&nbsp; install -m 0755 ${ESLOCATION}/$esprog<br>&gt; &gt; &gt;${D}${b=
indir}/ES${esrev}.0/<br>&gt; &gt; &gt;&gt; 2&gt;/dev/null || true<br>&gt; &=
gt; &gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp; done<br>&gt; &gt; &gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp; &nb=
sp;&nbsp;&nbsp; fi<br>&gt; &gt; &gt;&gt; @@ -225,17 +179,6 @@ do_install ()=
 {<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp; rm =
${D}${bindir}/ES*/*.h ${D}${bindir}/ES*/pdsasm<br>&gt; &gt; &gt;&gt; ${D}${=
bindir}/pdsasm -f || true<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt; -&nbs=
p;&nbsp;&nbsp; install -d ${D}${prefix}/share/applications<br>&gt; &gt; &gt=
;&gt; -&nbsp;&nbsp;&nbsp; cp ${WORKDIR}/*.desktop ${D}${prefix}/share/appli=
cations<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; rm ${D}${prefix}/share/ap=
plications/sample.desktop<br>&gt; &gt; &gt;&gt; -<br>&gt; &gt; &gt;&gt; -&n=
bsp;&nbsp;&nbsp; if [ ${SUPPORT_XORG} -eq 1 ] ; then<br>&gt; &gt; &gt;&gt; =
-&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install -d ${D}${bindir}/SGX/demos/X=
11/<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install -m=
 0755 ${S}/demos/x11/*<br>&gt; &gt; &gt;&gt;
 ${D}${bindir}/SGX/demos/X11/<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; &nb=
sp;&nbsp;&nbsp; install -d ${D}${bindir}/SGX/trainingcourses/X11<br>&gt; &g=
t; &gt;&gt; 2&gt;/dev/null || true<br>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp=
; &nbsp;&nbsp;&nbsp; install -m 0755 ${S}/trainingcourses/x11/*<br>&gt; &gt=
; &gt;&gt; ${D}${bindir}/SGX/trainingcourses/X11/ 2&gt;/dev/null || true<br=
>&gt; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; fi<br>&gt; &gt; &gt;&gt; -<br>&gt; =
&gt; &gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp; install -d ${D}${bindir}/SGX/demos/R=
aw/<br>&gt; &gt; &gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp; install -m 0755 ${S}/dem=
os/raw/*<br>&gt; &gt; &gt;&gt; ${D}${bindir}/SGX/demos/Raw/<br>&gt; &gt; &g=
t;&gt;&nbsp; &nbsp;&nbsp;&nbsp; install -d ${D}${bindir}/SGX/trainingcourse=
s/Raw<br>&gt; &gt; &gt;&gt; 2&gt;/dev/null || true<br>&gt; &gt; &gt;&gt; @@=
 -251,8 +194,7 @@ do_install () {<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&g=
t;&nbsp; }<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt; -PACKAGES =3D+
 "${@base_contains('DISTRO_FEATURES', 'x11',"${PN}-<br>&gt; &gt; &gt;&gt; x=
11demos ${PN}-x11trainingcourses xserver-kdrive-powervrsgx"<br>&gt; &gt; &g=
t;,"", d)}<br>&gt; &gt; &gt;&gt; \<br>&gt; &gt; &gt;&gt; -&nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;  ${PN}-rawdemos ${PN}-rawtrainingcourses ${PN}-<br=
>&gt; &gt; &gt;&gt; tests"<br>&gt; &gt; &gt;&gt; +PACKAGES =3D+ "${PN}-rawd=
emos ${PN}-rawtrainingcourses ${PN}-<br>&gt; &gt; &gt;&gt; tests"<br>&gt; &=
gt; &gt;&gt;&nbsp; # Package the base libraries per silicon revision&nbsp; =
PACKAGES =3D+<br>&gt; &gt; &gt;&gt; "${PN}-es2 ${PN}-es3 ${PN}-es5 ${PN}-es=
6 ${PN}-es8"<br>&gt; &gt; &gt;&gt;&nbsp; RRECOMMENDS_${PN} +=3D "${PN}-es2 =
${PN}-es3 ${PN}-es5 ${PN}-es6<br>&gt; &gt; &gt;&gt; ${PN}-es8"<br>&gt; &gt;=
 &gt;&gt; @@ -271,18 +213,14 @@ PRIVATE_LIBS_${PN}-es8 =3D "libGLESv2.so<br=
>&gt; &gt; &gt;&gt; libIMGegl.so libsrv_um.so libOpenVG.so li<br>&gt; &gt; =
&gt;&gt;<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt;&nbsp; PACKAGES =3D+
 "${PN}-blitwsegl ${PN}-flipwsegl ${PN}-frontwsegl<br>&gt; &gt; &gt;&gt; ${=
PN}-linuxfbwsegl"<br>&gt; &gt; &gt;&gt; -PACKAGES =3D+ "${@base_contains('D=
ISTRO_FEATURES', 'x11',"${PN}-<br>&gt; &gt; &gt;&gt; x11wsegl ${PN}-driwseg=
l" ,"", d)}"<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt;&nbsp; FILES_${PN=
}-blitwsegl =3D "${libdir}/libpvrPVR2D_BLITWSEGL.so.*"<br>&gt; &gt; &gt;&gt=
;&nbsp; FILES_${PN}-flipwsegl =3D "${libdir}/libpvrPVR2D_FLIPWSEGL.so.*"<br=
>&gt; &gt; &gt;&gt;&nbsp; FILES_${PN}-frontwsegl =3D<br>&gt; &gt; &gt;"${li=
bdir}/libpvrPVR2D_FRONTWSEGL.so.*"<br>&gt; &gt; &gt;&gt;&nbsp; FILES_${PN}-=
linuxfbwsegl =3D<br>&gt; &gt; &gt;&gt; "${libdir}/libpvrPVR2D_LINUXFBWSEGL.=
so.*"<br>&gt; &gt; &gt;&gt; -FILES_${PN}-x11wsegl =3D "${libdir}/libpvrPVR2=
D_X11WSEGL.so*<br>&gt; &gt; &gt;&gt; ${bindir}/x* ${bindir}/*x"<br>&gt; &gt=
; &gt;&gt; -FILES_${PN}-driwsegl =3D "${libdir}/libpvrPVR2D_DRIWSEGL.so*<br=
>&gt; &gt; &gt;&gt; ${libdir}/libsrv_um_dri*"<br>&gt; &gt; &gt;&gt;<br>&gt;=
 &gt;
 &gt;&gt;&nbsp; PACKAGES =3D+ "${PN}-blitwsegl-es2 ${PN}-blitwsegl-es3 ${PN=
}-<br>&gt; &gt; &gt;&gt; blitwsegl-es5 ${PN}-blitwsegl-es6 ${PN}-blitwsegl-=
es8 ${PN}-<br>&gt; &gt; &gt;&gt; flipwsegl-es2 ${PN}-flipwsegl-es3 ${PN}-fl=
ipwsegl-es5 ${PN}-<br>&gt; &gt; &gt;&gt; flipwsegl-es6 ${PN}-flipwsegl-es8 =
${PN}-frontwsegl-es2 ${PN}-<br>&gt; &gt; &gt;&gt; frontwsegl-es3 ${PN}-fron=
twsegl-es5 ${PN}-frontwsegl-es6 ${PN}-<br>&gt; &gt; &gt;&gt; frontwsegl-es8=
 ${PN}-linuxfbwsegl-es2 ${PN}-linuxfbwsegl-es3<br>&gt; &gt; &gt;&gt; ${PN}-=
linuxfbwsegl-es5 ${PN}-linuxfbwsegl-es6 ${PN}-<br>&gt; &gt; &gt;linuxfbwseg=
l- es8"<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt; -X11_SEGL =3D " ${PN}-x=
11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-<br>&gt; &gt; &gt;&gt; x11wsegl-es5 ${=
PN}-x11wsegl-es6 ${PN}-x11wsegl-es8 ${PN}-<br>&gt; &gt; &gt;&gt; driwsegl-e=
s2 ${PN}-driwsegl-es3 ${PN}-driwsegl-es5 ${PN}-<br>&gt; &gt; &gt;&gt; driws=
egl-es6 ${PN}-driwsegl-es8 "<br>&gt; &gt; &gt;&gt; -PACKAGES =3D+
 "${@base_contains('DISTRO_FEATURES',<br>&gt; &gt; &gt;&gt; 'x11',"${X11_SE=
GL}" ,"", d)}"<br>&gt; &gt; &gt;&gt;&nbsp; FILES_${PN}-blitwsegl-es2 =3D<br=
>&gt; &gt; &gt;&gt; "${libdir}/ES2*/libpvrPVR2D_BLITWSEGL.so.*"<br>&gt; &gt=
; &gt;&gt;&nbsp; FILES_${PN}-blitwsegl-es3 =3D<br>&gt; &gt; &gt;&gt; "${lib=
dir}/ES3*/libpvrPVR2D_BLITWSEGL.so.*"<br>&gt; &gt; &gt;&gt;&nbsp; FILES_${P=
N}-blitwsegl-es5 =3D<br>&gt; &gt; &gt;&gt; "${libdir}/ES5*/libpvrPVR2D_BLIT=
WSEGL.so.*"<br>&gt; &gt; &gt;&gt; @@ -311,25 +249,10 @@ FILES_${PN}-linuxfb=
wsegl-es6 =3D<br>&gt; &gt; &gt;&gt; "${libdir}/ES6*/libpvrPVR2D_LINUXFBWSEG=
L.so.*"<br>&gt; &gt; &gt;&gt;&nbsp; FILES_${PN}-linuxfbwsegl-es8 =3D<br>&gt=
; &gt; &gt;&gt; "${libdir}/ES8*/libpvrPVR2D_LINUXFBWSEGL.so.*"<br>&gt; &gt;=
 &gt;&gt;&nbsp; RRECOMMENDS_${PN}-linuxfbwsegl =3D " ${PN}-linuxfbwsegl-es2=
<br>&gt; &gt; &gt;${PN}-<br>&gt; &gt; &gt;&gt; linuxfbwsegl-es3 ${PN}-linux=
fbwsegl-es5 ${PN}-linuxfbwsegl-es6<br>&gt; &gt; &gt;&gt;
 ${PN}-linuxfbwsegl-es8"<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt; -FILES=
_${PN}-x11wsegl-es2 =3D<br>&gt; &gt; &gt;&gt; "${libdir}/ES2*/libpvrPVR2D_X=
11WSEGL.so.* ${bindir}/ES2*/x*<br>&gt; &gt; &gt;&gt; ${bindir}/ES2*/*x"<br>=
&gt; &gt; &gt;&gt; -FILES_${PN}-x11wsegl-es3 =3D<br>&gt; &gt; &gt;&gt; "${l=
ibdir}/ES3*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES3*/x*<br>&gt; &gt; &gt;&g=
t; ${bindir}/ES3*/*x"<br>&gt; &gt; &gt;&gt; -FILES_${PN}-x11wsegl-es5 =3D<b=
r>&gt; &gt; &gt;&gt; "${libdir}/ES5*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES=
5*/x*<br>&gt; &gt; &gt;&gt; ${bindir}/ES5*/*x"<br>&gt; &gt; &gt;&gt; -FILES=
_${PN}-x11wsegl-es6 =3D<br>&gt; &gt; &gt;&gt; "${libdir}/ES6*/libpvrPVR2D_X=
11WSEGL.so.* ${bindir}/ES6*/x*<br>&gt; &gt; &gt;&gt; ${bindir}/ES6*/*x"<br>=
&gt; &gt; &gt;&gt; -FILES_${PN}-x11wsegl-es8 =3D<br>&gt; &gt; &gt;&gt; "${l=
ibdir}/ES8*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES8*/x*<br>&gt; &gt; &gt;&g=
t; ${bindir}/ES8*/*x"<br>&gt; &gt; &gt;&gt; -RRECOMMENDS_${PN}-x11wsegl =3D=
 "
 ${PN}-x11wsegl-es2 ${PN}-<br>&gt; &gt; &gt;&gt; x11wsegl-es3 ${PN}-x11wseg=
l-es5 ${PN}-x11wsegl-es6 ${PN}-<br>&gt; &gt; &gt;&gt; x11wsegl-es8"<br>&gt;=
 &gt; &gt;&gt; -<br>&gt; &gt; &gt;&gt; -FILES_${PN}-driwsegl-es2 =3D<br>&gt=
; &gt; &gt;&gt; "${libdir}/ES2*/libpvrPVR2D_DRIWSEGL.so.*<br>&gt; &gt; &gt;=
&gt; ${libdir}/ES2*/libsrv_um_dri*"<br>&gt; &gt; &gt;&gt; -FILES_${PN}-driw=
segl-es3 =3D<br>&gt; &gt; &gt;&gt; "${libdir}/ES3*/libpvrPVR2D_DRIWSEGL.so.=
*<br>&gt; &gt; &gt;&gt; ${libdir}/ES3*/libsrv_um_dri*"<br>&gt; &gt; &gt;&gt=
; -FILES_${PN}-driwsegl-es5 =3D<br>&gt; &gt; &gt;&gt; "${libdir}/ES5*/libpv=
rPVR2D_DRIWSEGL.so.*<br>&gt; &gt; &gt;&gt; ${libdir}/ES5*/libsrv_um_dri*"<b=
r>&gt; &gt; &gt;&gt; -FILES_${PN}-driwsegl-es6 =3D<br>&gt; &gt; &gt;&gt; "$=
{libdir}/ES6*/libpvrPVR2D_DRIWSEGL.so.*<br>&gt; &gt; &gt;&gt; ${libdir}/ES6=
*/libsrv_um_dri*"<br>&gt; &gt; &gt;&gt; -FILES_${PN}-driwsegl-es8 =3D<br>&g=
t; &gt; &gt;&gt; "${libdir}/ES8*/libpvrPVR2D_DRIWSEGL.so.*<br>&gt; &gt;
 &gt;&gt; ${libdir}/ES8*/libsrv_um_dri*"<br>&gt; &gt; &gt;&gt; -RRECOMMENDS=
_${PN}-driwsegl =3D " ${PN}-driwsegl-es2 ${PN}-<br>&gt; &gt; &gt;&gt; driws=
egl-es3 ${PN}-driwsegl-es5 ${PN}-driwsegl-es6 ${PN}-<br>&gt; &gt; &gt;&gt; =
driwsegl-es8"<br>&gt; &gt; &gt;&gt; -<br>&gt; &gt; &gt;&gt;&nbsp; CONFFILES=
_${PN} =3D "${sysconfdir}/powervr.ini"<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &=
gt;&gt;&nbsp; FILES_${PN} =3D "${sysconfdir} ${libdir}/*.so*<br>&gt; &gt; &=
gt;${bindir}/${PVR_INIT}<br>&gt; &gt; &gt;&gt; ${bindir}/cputype ${bindir}/=
*"<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt; -FILES_xserver-kdrive-powerv=
rsgx =3D "${bindir}/Xsgx"<br>&gt; &gt; &gt;&gt;&nbsp; FILES_${PN}-tests =3D=
 "${bindir}/*test*"<br>&gt; &gt; &gt;&gt;&nbsp; FILES_${PN}-dbg =3D "${libd=
ir}/.debug/* ${bindir}/.debug/* \<br>&gt; &gt; &gt;&gt;&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  ${libdir}/ES*/.debug ${b=
indir}/*/.debug\ @@<br>&gt; &gt; &gt;&gt; -338,12 +261,8 @@ FILES_${PN}-dbg=
 =3D
 "${libdir}/.debug/*<br>&gt; &gt; &gt;&gt; ${bindir}/.debug/* \<br>&gt; &gt=
; &gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp; "<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &g=
t;&gt;&nbsp; FILES_${PN}-rawdemos =3D "${bindir}/SGX/demos/Raw/*"<br>&gt; &=
gt; &gt;&gt; -FILES_${PN}-x11demos =3D "${bindir}/SGX/demos/X11/*<br>&gt; &=
gt; &gt;&gt; ${prefix}/share/applications "<br>&gt; &gt; &gt;&gt; -RRECOMME=
NDS_${PN}-x11demos =3D "${PN}-x11wsegl"<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; =
&gt;&gt;&nbsp; FILES_${PN}-rawtrainingcourses =3D<br>&gt; &gt; &gt;&gt; "${=
bindir}/SGX/trainingcourses/Raw/*"<br>&gt; &gt; &gt;&gt; -FILES_${PN}-x11tr=
ainingcourses =3D<br>&gt; &gt; &gt;&gt; "${bindir}/SGX/trainingcourses/X11/=
*"<br>&gt; &gt; &gt;&gt; -RRECOMMENDS_${PN}-x11trainingcourses =3D "${PN}-x=
11wsegl"<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt;&nbsp; # The libs need =
the kernel-modules<br>&gt; &gt; &gt;&gt;&nbsp; RRECOMMENDS_${PN} +=3D "omap=
3-sgx-modules"<br>&gt; &gt; &gt;&gt; @@ -358,7 +277,6 @@ INSANE_SKIP_${PN}-=
es5 =3D
 "ldflags dev-so<br>&gt; &gt; &gt;staticdev"<br>&gt; &gt; &gt;&gt;&nbsp; IN=
SANE_SKIP_${PN}-es6 =3D "ldflags dev-so staticdev"<br>&gt; &gt; &gt;&gt;&nb=
sp; INSANE_SKIP_${PN}-es8 =3D "ldflags dev-so staticdev"<br>&gt; &gt; &gt;&=
gt;&nbsp; INSANE_SKIP_${PN}-rawdemos =3D "ldflags dev-so useless-rpaths"<br=
>&gt; &gt; &gt;&gt; -INSANE_SKIP_${PN}-x11demos =3D "ldflags dev-so useless=
-rpaths"<br>&gt; &gt; &gt;&gt;&nbsp; INSANE_SKIP_${PN}-blitwsegl =3D "ldfla=
gs"<br>&gt; &gt; &gt;&gt;&nbsp; INSANE_SKIP_${PN}-blitwsegl-es3 =3D "ldflag=
s"<br>&gt; &gt; &gt;&gt;&nbsp; INSANE_SKIP_${PN}-blitwsegl-es5 =3D "ldflags=
"<br>&gt; &gt; &gt;&gt; @@ -379,18 +297,7 @@ INSANE_SKIP_${PN}-linuxfbwsegl=
-es3 =3D<br>&gt; &gt; &gt;"ldflags"<br>&gt; &gt; &gt;&gt;&nbsp; INSANE_SKIP=
_${PN}-linuxfbwsegl-es5 =3D "ldflags"<br>&gt; &gt; &gt;&gt;&nbsp; INSANE_SK=
IP_${PN}-linuxfbwsegl-es6 =3D "ldflags"<br>&gt; &gt; &gt;&gt;&nbsp; INSANE_=
SKIP_${PN}-linuxfbwsegl-es8 =3D "ldflags"<br>&gt; &gt; &gt;&gt;
 -INSANE_SKIP_${PN}-x11wsegl =3D "ldflags dev-so"<br>&gt; &gt; &gt;&gt; -IN=
SANE_SKIP_${PN}-x11wsegl-es3 =3D "ldflags dev-so"<br>&gt; &gt; &gt;&gt; -IN=
SANE_SKIP_${PN}-x11wsegl-es5 =3D "ldflags dev-so"<br>&gt; &gt; &gt;&gt; -IN=
SANE_SKIP_${PN}-x11wsegl-es6 =3D "ldflags dev-so"<br>&gt; &gt; &gt;&gt; -IN=
SANE_SKIP_${PN}-x11wsegl-es8 =3D "ldflags dev-so"<br>&gt; &gt; &gt;&gt; -IN=
SANE_SKIP_${PN}-driwsegl =3D "ldflags dev-so"<br>&gt; &gt; &gt;&gt; -INSANE=
_SKIP_${PN}-driwsegl-es3 =3D "ldflags dev-so"<br>&gt; &gt; &gt;&gt; -INSANE=
_SKIP_${PN}-driwsegl-es5 =3D "ldflags dev-so"<br>&gt; &gt; &gt;&gt; -INSANE=
_SKIP_${PN}-driwsegl-es6 =3D "ldflags dev-so"<br>&gt; &gt; &gt;&gt; -INSANE=
_SKIP_${PN}-driwsegl-es8 =3D "ldflags dev-so"<br>&gt; &gt; &gt;&gt;&nbsp; I=
NSANE_SKIP_${PN}-tests =3D "ldflags"<br>&gt; &gt; &gt;&gt; -INSANE_SKIP_xse=
rver-kdrive-powervrsgx =3D "ldflags"<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt=
;&gt;&nbsp; # Quality control is really poor on these SDKs, so hack around<=
br>&gt; &gt;
 &gt;the<br>&gt; &gt; &gt;&gt; latest madness:<br>&gt; &gt; &gt;&gt;&nbsp; =
FILES_${PN} +=3D "${libdir}/*.so "<br>&gt; &gt; &gt;&gt; @@ -404,12 +311,6 =
@@ INITSCRIPT_PARAMS =3D "start 30 5 2 . stop 40<br>&gt; &gt; &gt;&gt; 0 1 =
6 ."<br>&gt; &gt; &gt;&gt;&nbsp; # Append to update-rc.d postinst<br>&gt; &=
gt; &gt;&gt;&nbsp; pkg_postinst_${PN}_append() {<br>&gt; &gt; &gt;&gt;&nbsp=
; rm -f $D${sysconfdir}/powervr-esrev<br>&gt; &gt; &gt;&gt; -<br>&gt; &gt; =
&gt;&gt; -if [ ${SUPPORT_XORG} -eq 1 ] ; then<br>&gt; &gt; &gt;&gt; -&nbsp;=
&nbsp;&nbsp; ln -sf /usr/lib/libXdmcp.so.6.0.0 /usr/lib/libXdmcp.so.0<br>&g=
t; &gt; &gt;&gt; -&nbsp;&nbsp;&nbsp; ln -sf /usr/lib/libXau.so.6.0.0 /usr/l=
ib/libXau.so.0<br>&gt; &gt; &gt;&gt; -fi<br>&gt; &gt; &gt;&gt; -<br>&gt; &g=
t; &gt;&gt;&nbsp; }<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt;&nbsp; pkg_p=
ostinst_${PN}-blitwsegl() {<br>&gt; &gt; &gt;&gt; @@ -427,14 +328,3 @@ pkg_=
postinst_${PN}-linuxfbwsegl() {&nbsp; rm -f<br>&gt; &gt; &gt;&gt;
 $D${sysconfdir}/powervr-esrev&nbsp; }<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &=
gt;&gt; -pkg_postinst_${PN}-x11wsegl() {<br>&gt; &gt; &gt;&gt; -rm -f $D${s=
ysconfdir}/powervr-esrev<br>&gt; &gt; &gt;&gt; -<br>&gt; &gt; &gt;&gt; -ech=
o "[default]" &gt; $D${sysconfdir}/powervr.ini -echo<br>&gt; &gt; &gt;&gt; =
"WindowSystem=3DlibpvrPVR2D_X11WSEGL.so.1" &gt;&gt;<br>&gt; &gt; &gt;&gt; $=
D${sysconfdir}/powervr.ini -}<br>&gt; &gt; &gt;&gt; -<br>&gt; &gt; &gt;&gt;=
 -pkg_postinst_${PN}-driwsegl() {<br>&gt; &gt; &gt;&gt; -rm -f $D${sysconfd=
ir}/powervr-esrev<br>&gt; &gt; &gt;&gt; -}<br>&gt; &gt; &gt;&gt; -<br>&gt; =
&gt; &gt;&gt; diff --git a/recipes-graphics/libgles/libgles-<br>&gt; &gt; &=
gt;omap3_4.09.00.01.bb<br>&gt; &gt; &gt;&gt; b/recipes-graphics/libgles/lib=
gles-omap3_4.09.00.01.bb<br>&gt; &gt; &gt;&gt; index 7c6f231..165a406 10064=
4<br>&gt; &gt; &gt;&gt; --- a/recipes-graphics/libgles/libgles-omap3_4.09.0=
0.01.bb<br>&gt; &gt; &gt;&gt; +++
 b/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb<br>&gt; &gt; &gt;&g=
t; @@ -23,8 +23,6 @@ TI_BIN_UNPK_WDEXT :=3D "/Graphics_SDK_${SGXPV}"<br>&gt=
; &gt; &gt;&gt;&nbsp; SRC_URI =3D "<a href=3D"http://software-/" target=3D"=
_blank">http://software-</a><br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;dl.ti.c=
om/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV<br>&gt; &gt; &gt=
;&gt; }/exports/${BINFILE} \<br>&gt; &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;  file://cputype \<br>&gt; &gt; &gt;&gt;&nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;  file://rc.pvr \<br>&gt; &gt; &gt;&gt; -&nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;  file://rc_dri.pvr \<br>&gt; &gt; &gt;&gt; -&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;  file://sample.desktop \<br>&gt; &gt; &gt;&gt;&n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  file://99-bufferclass.rules&nbsp; =
\&nbsp; "<br>&gt; &gt; &gt;&gt;&nbsp; SRC_URI[md5sum] =3D "bd35e9d8843aff3a=
2aca9d41e7db1c7d"<br>&gt; &gt; &gt;&gt; @@ -32,44 +30,5 @@ SRC_URI[sha256su=
m]
 =3D<br>&gt; &gt; &gt;&gt; "eb37f75ddde4640b09e760fa86e689beb394330ecdf6878=
6188c34f249<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt;&nbsp; S =3D "${WORK=
DIR}/Graphics_SDK_${SGXPV}"<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt; -LI=
BGLESWINDOWSYSTEM ?=3D "${@base_contains('DISTRO_FEATURES',<br>&gt; &gt; &g=
t;&gt; 'x11',"libpvrPVR2D_DRIWSEGL.so" ,"libpvrPVR2D_FRONTWSEGL.so.1",<br>&=
gt; &gt; &gt;d)}"<br>&gt; &gt; &gt;&gt; +LIBGLESWINDOWSYSTEM ?=3D "libpvrPV=
R2D_FRONTWSEGL.so.1"<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt; -do_config=
ure_append() {<br>&gt; &gt; &gt;&gt; -<br>&gt; &gt; &gt;&gt; -&nbsp; &nbsp;=
 # Change PVR server's user mode library to point to DRI<br>&gt; &gt; &gt;&=
gt; -&nbsp; &nbsp; for drifile in $(find ${S} -name "libsrv_um_dri.so"); do=
<br>&gt; &gt; &gt;&gt; -&nbsp; &nbsp; if [ "$drifile" !=3D "" ]<br>&gt; &gt=
; &gt;&gt; -&nbsp; &nbsp; then<br>&gt; &gt; &gt;&gt; -&nbsp; &nbsp; &nbsp; =
&nbsp; dir=3D$(dirname ${drifile})<br>&gt; &gt; &gt;&gt; -&nbsp; &nbsp; &nb=
sp;
 &nbsp; if [ "$SUPPORT_XORG" =3D "1" ]<br>&gt; &gt; &gt;&gt; -&nbsp; &nbsp;=
 &nbsp; &nbsp; then<br>&gt; &gt; &gt;&gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; mv ${dir}/libsrv_um_dri.so ${dir}/libsrv_um.so<br>&gt; &gt; &gt;&=
gt; -&nbsp; &nbsp; &nbsp; &nbsp; else<br>&gt; &gt; &gt;&gt; -&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; rm -rf ${dir}/libsrv_um_dri.so<br>&gt; &gt; &gt=
;&gt; -&nbsp; &nbsp; &nbsp; &nbsp; fi<br>&gt; &gt; &gt;&gt; -&nbsp; &nbsp; =
fi<br>&gt; &gt; &gt;&gt; -<br>&gt; &gt; &gt;&gt; -&nbsp; &nbsp; done<br>&gt=
; &gt; &gt;&gt; -}<br>&gt; &gt; &gt;&gt; -<br>&gt; &gt; &gt;&gt; -do_instal=
l_append() {<br>&gt; &gt; &gt;&gt; -<br>&gt; &gt; &gt;&gt; -&nbsp; &nbsp; #=
 In this version of the graphics SDK the following<br>&gt; &gt; &gt;&gt; di=
rectories do not exist:<br>&gt; &gt; &gt;&gt; -&nbsp; &nbsp; #<br>&gt; &gt;=
 &gt;&gt; /GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/pvr2d.h<br>&=
gt; &gt; &gt;&gt; (doesn't exist)<br>&gt; &gt; &gt;&gt; -&nbsp; &nbsp;
 #<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;/GFX_Linux_SDK/OGLES/SDKPackage/B=
uilds/OGLES/Include/GLES/egltype<br>&gt; &gt; &gt;&gt; s.h (doesn't exist)<=
br>&gt; &gt; &gt;&gt; -&nbsp; &nbsp; # Therefore, need to copy these files =
manually at the only<br>&gt; &gt; &gt;&gt; location that they do exist<br>&=
gt; &gt; &gt;&gt; -&nbsp; &nbsp; cp -pPr ${S}/include/pvr2d/*.h ${D}${inclu=
dedir}<br>&gt; &gt; &gt;&gt; -&nbsp; &nbsp; cp -pPr ${S}/include/OGLES/GLES=
 ${D}${includedir}/<br>&gt; &gt; &gt;&gt; -<br>&gt; &gt; &gt;&gt; -&nbsp; &=
nbsp; rm ${D}${sysconfdir}/init.d/pvr-init<br>&gt; &gt; &gt;&gt; -<br>&gt; =
&gt; &gt;&gt; -&nbsp; &nbsp; if [ "$SUPPORT_XORG" =3D "1" ]; then<br>&gt; &=
gt; &gt;&gt; -&nbsp; &nbsp; &nbsp; &nbsp; cp -pP ${WORKDIR}/rc_dri.pvr<br>&=
gt; &gt; &gt;&gt; ${D}${sysconfdir}/init.d/pvr-init<br>&gt; &gt; &gt;&gt; -=
&nbsp; &nbsp; else<br>&gt; &gt; &gt;&gt; -&nbsp; &nbsp; &nbsp; &nbsp; cp -p=
P ${WORKDIR}/rc.pvr ${D}${sysconfdir}/init.d/pvr-<br>&gt; &gt;
 &gt;&gt; init<br>&gt; &gt; &gt;&gt; -&nbsp; &nbsp; fi<br>&gt; &gt; &gt;&gt=
; -<br>&gt; &gt; &gt;&gt; -}<br>&gt; &gt; &gt;&gt; -<br>&gt; &gt; &gt;&gt; =
-RRECOMMENDS_${PN}-x11demos =3D "${PN}-driwsegl"<br>&gt; &gt; &gt;&gt; -RRE=
COMMENDS_${PN}-x11trainingcourses =3D "${PN}-driwsegl"<br>&gt; &gt; &gt;&gt=
; --<br>&gt; &gt; &gt;&gt; 1.7.1<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt=
; _______________________________________________<br>&gt; &gt; &gt;&gt; met=
a-ti mailing list<br>&gt; &gt; &gt;&gt; <a ymailto=3D"mailto:meta-ti@yoctop=
roject.org" href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.o=
rg</a><br>&gt; &gt; &gt;&gt; <a href=3D"https://lists.yoctoproject.org/list=
info/meta-ti" target=3D"_blank">https://lists.yoctoproject.org/listinfo/met=
a-ti</a><br>&gt; &gt; _______________________________________________<br>&g=
t; &gt; meta-ti mailing list<br>&gt; &gt; <a ymailto=3D"mailto:meta-ti@yoct=
oproject.org"
 href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br>&=
gt; &gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=
=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>&gt; &gt=
; <br>&gt; _______________________________________________<br>&gt; meta-ti =
mailing list<br>&gt; <a ymailto=3D"mailto:meta-ti@yoctoproject.org" href=3D=
"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br>&gt; <a h=
ref=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"_blank">h=
ttps://lists.yoctoproject.org/listinfo/meta-ti</a><br>_____________________=
__________________________<br>meta-ti mailing list<br><a ymailto=3D"mailto:=
meta-ti@yoctoproject.org" href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@=
yoctoproject.org</a><br><a href=3D"https://lists.yoctoproject.org/listinfo/=
meta-ti" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-ti<=
/a><br>_______________________________________________<br>meta-ti mailing l=
ist<br><a
 ymailto=3D"mailto:meta-ti@yoctoproject.org" href=3D"mailto:meta-ti@yoctopr=
oject.org">meta-ti@yoctoproject.org</a><br><a href=3D"https://lists.yoctopr=
oject.org/listinfo/meta-ti" target=3D"_blank">https://lists.yoctoproject.or=
g/listinfo/meta-ti</a><br><br><br></div> </div> </div>  </div></body></html=
>

---1981468715-1279370570-1368810135=:92464--
