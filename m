Return-Path: <andy.pont@sdcsystems.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BDA95E00D33; Thu, 25 Jul 2019 11:01:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	MIME_QP_LONG_LINE,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [216.40.44.112 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* 0.0 MIME_QP_LONG_LINE RAW: Quoted-printable line longer than 76 chars
Received: from smtprelay.hostedemail.com (smtprelay0112.hostedemail.com
	[216.40.44.112])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B2E0E00C22;
	Thu, 25 Jul 2019 11:01:56 -0700 (PDT)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
	[216.40.38.60])
	by smtprelay07.hostedemail.com (Postfix) with ESMTP id 41811181D341E;
	Thu, 25 Jul 2019 18:01:55 +0000 (UTC)
X-Session-Marker: 616E64792E706F6E744073646373797374656D732E636F6D
X-HE-Tag: death74_67f3b08b47d2e
X-Filterd-Recvd-Size: 4528
Received: from [192.168.10.100] (unknown [5.133.40.160])
	(Authenticated sender: andy.pont@sdcsystems.com)
	by omf04.hostedemail.com (Postfix) with ESMTPA;
	Thu, 25 Jul 2019 18:01:54 +0000 (UTC)
From: "Andy Pont" <andy.pont@sdcsystems.com>
To: meta-ti@yoctoproject.org
Date: Thu, 25 Jul 2019 18:01:52 +0000
Message-Id: <em1089794b-e289-422b-82ef-4588c5dda823@andys-imac.local>
In-Reply-To: <em8e44e63f-388a-4ff6-ace9-d28ccd87f383@andys-imac.local>
References: <em8e44e63f-388a-4ff6-ace9-d28ccd87f383@andys-imac.local>
User-Agent: eM_Client/7.2.35700.0
Mime-Version: 1.0
Cc: Yocto-mailing-list <yocto@yoctoproject.org>
Subject: Re: [yocto] Building for AM335x with meta-ti and meta-qt5
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
X-List-Received-Date: Thu, 25 Jul 2019 18:01:57 -0000
Content-Type: multipart/alternative;
	boundary="------=_MBCBE5420E-E76D-4A56-A545-19C3D84E4965"

--------=_MBCBE5420E-E76D-4A56-A545-19C3D84E4965
Content-Type: text/plain; format=flowed; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I wrote about trying to compile the SGX kernel modules giving up with =0Ath=
e following error:=0A=0A>| ******* Multiarch build: no=0A>| ******* Primary =
arch:    target_armel=0A>| ******* Secondary arch:  none=0A>| ../config/co=
re.mk:513: $(KERNELDIR)/vmlinux does not exist. Kbuild =0A>may fail.=0A>| e=
urasiacon/build/linux2/toplevel.mk:230: =0A>eurasiacon/build/linux2/moduled=
efs/target_armel.mk: No such file or =0A>directory=0A>=0AThis gets pulled f=
rom =0Ahttps://git.ti.com/graphics/omap5-sgx-ddk-linux/commits/ti-img-sgx/1=
.17.4948957/k4.19 =0Aand the files in the =E2=80=A6/eurasiacon/build/linux2=
/moduledefs/ directory =0Aare:=0A=0Ahost_i386.mk=0Atarget_aarch64.mk=0Atarg=
et_i686.mk=0Atarget_neutral.mk=0Ahost_x86_64.mk=0Atarget_armhf.mk=0Atarget_=
mips32r2el.mk=0Atarget_x86_64.mk=0A=0AI=E2=80=99m guessing it is supposed t=
o be using target_armhf.mk but I can=E2=80=99t =0Afigure out why it is maki=
ng the incorrect decision and trying to use a =0Afile that doesn=E2=80=99t=
 exist.=0A=0A-Andy.

--------=_MBCBE5420E-E76D-4A56-A545-19C3D84E4965
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><style id=3D"css_styles">blockquote.cite { margin-left: 5px; ma=
rgin-right: 0px; padding-left: 10px; padding-right:0px; border-left: 1px so=
lid #cccccc }=0Ablockquote.cite2 {margin-left: 5px; margin-right: 0px; padd=
ing-left: 10px; padding-right:0px; border-left: 1px solid #cccccc; margin-t=
op: 3px; padding-top: 0px; }=0Aa img { border: 0px; }=0Ali[style=3D'text-al=
ign: center;'], li[style=3D'text-align: right;'] {  list-style-position: in=
side;}=0Abody { font-family: Verdana; font-size: 12px;   }</style></head><b=
ody class=3D"plain"><div><div>I wrote about trying to compile the SGX kerne=
l modules giving up with the following error:</div><div><br /></div>=0A</di=
v><div id=3D"xfe68d91ad52d451"><blockquote type=3D"cite" class=3D"cite2"><d=
iv>| ******* Multiarch build: no<br />| ******* Primary arch:=C2=A0 =C2=A0=
 target_armel<br />| ******* Secondary arch:=C2=A0 none<br />| ../config/cor=
e.mk:513: $(KERNELDIR)/vmlinux does not exist. Kbuild may fail.<br />| eura=
siacon/build/linux2/toplevel.mk:230: eurasiacon/build/linux2/moduledefs/tar=
get_armel.mk: No such file or directory</div><div><br /></div></blockquote>=
This gets pulled from=C2=A0<a href=3D"https://git.ti.com/graphics/omap5-sgx=
-ddk-linux/commits/ti-img-sgx/1.17.4948957/k4.19">https://git.ti.com/graphi=
cs/omap5-sgx-ddk-linux/commits/ti-img-sgx/1.17.4948957/k4.19</a>=C2=A0and t=
he files in the =E2=80=A6/eurasiacon/build/linux2/moduledefs/ directory are=
:</div><div id=3D"xfe68d91ad52d451"><br /></div><div id=3D"xfe68d91ad52d451=
">host_i386.mk</div><div id=3D"xfe68d91ad52d451">target_aarch64.mk</div><di=
v id=3D"xfe68d91ad52d451">target_i686.mk</div><div id=3D"xfe68d91ad52d451">=
target_neutral.mk<br />host_x86_64.mk</div><div id=3D"xfe68d91ad52d451">tar=
get_armhf.mk</div><div id=3D"xfe68d91ad52d451">target_mips32r2el.mk</div><d=
iv id=3D"xfe68d91ad52d451">target_x86_64.mk</div><div id=3D"xfe68d91ad52d45=
1"><br /></div><div id=3D"xfe68d91ad52d451">I=E2=80=99m guessing it is supp=
osed to be using target_armhf.mk but I can=E2=80=99t figure out why it is m=
aking the incorrect decision and trying to use a file that doesn=E2=80=99t=
 exist.</div><div id=3D"xfe68d91ad52d451"><br /></div><div id=3D"xfe68d91ad5=
2d451">-Andy.</div>=0A</body></html>

--------=_MBCBE5420E-E76D-4A56-A545-19C3D84E4965--
