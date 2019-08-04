Return-Path: <andy.pont@sdcsystems.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 66BF1E00C9E; Sun,  4 Aug 2019 05:03:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	MIME_QP_LONG_LINE,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [216.40.44.200 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* 0.0 MIME_QP_LONG_LINE RAW: Quoted-printable line longer than 76 chars
Received: from smtprelay.hostedemail.com (smtprelay0200.hostedemail.com
	[216.40.44.200])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6151DE007E1
	for <meta-ti@yoctoproject.org>; Sun,  4 Aug 2019 05:03:41 -0700 (PDT)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
	[216.40.38.60])
	by smtprelay01.hostedemail.com (Postfix) with ESMTP id DD193100E86C3
	for <meta-ti@yoctoproject.org>; Sun,  4 Aug 2019 12:03:39 +0000 (UTC)
X-Session-Marker: 616E64792E706F6E744073646373797374656D732E636F6D
X-HE-Tag: camp93_1fea523889316
X-Filterd-Recvd-Size: 4119
Received: from [192.168.10.100] (unknown [5.133.40.160])
	(Authenticated sender: andy.pont@sdcsystems.com)
	by omf15.hostedemail.com (Postfix) with ESMTPA
	for <meta-ti@yoctoproject.org>; Sun,  4 Aug 2019 12:03:39 +0000 (UTC)
From: "Andy Pont" <andy.pont@sdcsystems.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Date: Sun, 04 Aug 2019 12:03:37 +0000
Message-Id: <em44ffe6f3-add5-413e-994e-7c6409ff9a3f@andys-imac.local>
User-Agent: eM_Client/7.2.35700.0
Mime-Version: 1.0
Subject: Kernel config fragments not in deployed image.
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: Andy Pont <andy.pont@sdcsystems.com>
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sun, 04 Aug 2019 12:03:42 -0000
Content-Type: multipart/alternative;
	boundary="------=_MB751C0FAC-4C9A-47BC-BFC2-7CBAE5C253DF"

--------=_MB751C0FAC-4C9A-47BC-BFC2-7CBAE5C253DF
Content-Type: text/plain; format=flowed; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I have created a linux-ti-staging_4.19.bbappend which contains the =0Afollo=
wing:=0A=0AFILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:=E2=80=9D=0A=0ASR=
C_URI +=3D =E2=80=9C \=0A   file://rtl8192cu.cfg \=0A=E2=80=9C=0A=0AKERNEL_=
CONFIG_FRAGMENTS_append =3D =E2=80=9C \=0A   ${WORKDIR}/rtl8192cu.cfg \=0A=
=E2=80=9C=0A=0AThe rtl8192cu.cfg file enables a few options to build a kern=
el module =0Afor the RTL8192 USB WiFi module:=0A=0ACONFIG_RTL8192CU=3Dm=0AC=
ONFIG_RTLWIFI=3Dm=0ACONFIG_RTLWIFI_USB=3Dm=0ACONFIG_RTLWIFI_DEBUG=3Dy=0ACON=
FIG_RTL8192C_COMMON=3Dm=0A=0AAfter rebuilding the image I can find the resu=
ltant rtl8192cu.ko file in =0Aa number of directories under =0Atmp/work/bea=
glebone-poky-linux-gnueabi/linux-ti-staging/4.19.38+gitAUTOINC+c17c376661-r=
22a =0Abut it isn=E2=80=99t in the lib/modules/=E2=80=A6 directory in the d=
eployed image.=0A=0AHave I missed a step somewhere along the way?=0A=0A-And=
y.=0A=0A

--------=_MB751C0FAC-4C9A-47BC-BFC2-7CBAE5C253DF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><style id=3D"css_styles">blockquote.cite { margin-left: 5px; ma=
rgin-right: 0px; padding-left: 10px; padding-right:0px; border-left: 1px so=
lid #cccccc }=0Ablockquote.cite2 {margin-left: 5px; margin-right: 0px; padd=
ing-left: 10px; padding-right:0px; border-left: 1px solid #cccccc; margin-t=
op: 3px; padding-top: 0px; }=0Aa img { border: 0px; }=0Ali[style=3D'text-al=
ign: center;'], li[style=3D'text-align: right;'] {  list-style-position: in=
side;}=0Abody { font-family: Verdana; font-size: 12px;   }</style></head><b=
ody class=3D"plain"><div>I have created a linux-ti-staging_4.19.bbappend wh=
ich contains the following:</div><div><br /></div><div>FILESEXTRAPATHS_prep=
end :=3D "${THISDIR}/${PN}:=E2=80=9D</div><div><br /></div><div>SRC_URI +=
=3D =E2=80=9C \</div><div>=C2=A0 file://rtl8192cu.cfg \</div><div>=E2=80=9C=
</div><div><br /></div><div>KERNEL_CONFIG_FRAGMENTS_append =3D =E2=80=9C \<=
/div><div>=C2=A0 ${WORKDIR}/rtl8192cu.cfg \</div><div>=E2=80=9C</div><div><=
br /></div><div id=3D"signature_old">The rtl8192cu.cfg file enables a few o=
ptions to build a kernel module for the RTL8192 USB WiFi module:</div><div=
 id=3D"signature_old"><br /></div><div id=3D"signature_old">CONFIG_RTL8192CU=
=3Dm</div><div id=3D"signature_old">CONFIG_RTLWIFI=3Dm</div><div id=3D"sign=
ature_old">CONFIG_RTLWIFI_USB=3Dm</div><div id=3D"signature_old">CONFIG_RTL=
WIFI_DEBUG=3Dy</div><div id=3D"signature_old">CONFIG_RTL8192C_COMMON=3Dm</d=
iv><div id=3D"signature_old"><br /></div><div id=3D"signature_old">After re=
building the image I can find the resultant rtl8192cu.ko file in a number o=
f directories under tmp/work/beaglebone-poky-linux-gnueabi/linux-ti-staging=
/4.19.38+gitAUTOINC+c17c376661-r22a but it isn=E2=80=99t in the lib/modules=
/=E2=80=A6 directory in the deployed image.</div><div id=3D"signature_old">=
<br /></div><div id=3D"signature_old">Have I missed a step somewhere along=
 the way?</div><div id=3D"signature_old"><br /></div><div id=3D"signature_ol=
d">-Andy.</div><div id=3D"signature_old">=C2=A0=C2=A0</div><div><br /></div=
>=0A</body></html>

--------=_MB751C0FAC-4C9A-47BC-BFC2-7CBAE5C253DF--
