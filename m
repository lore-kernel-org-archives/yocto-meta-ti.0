Return-Path: <ankur.tyagi85@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 525CCE00B6D; Tue,  1 Sep 2015 20:43:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (ankur.tyagi85[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.53 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 08A0CE00A26
	for <meta-ti@yoctoproject.org>; Tue,  1 Sep 2015 20:43:02 -0700 (PDT)
Received: by vkbf67 with SMTP id f67so63291914vkb.0
	for <meta-ti@yoctoproject.org>; Tue, 01 Sep 2015 20:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=2nhoNkoTHp1kAhVMPwbFEABmSFj8G18xs5DJa6qOYAg=;
	b=YcJLehoivQVsZsAXYwFX+dEwjhcXrPE2xQm0KmUeoeiA9VmEyKkI85lWhUjHeSFe4T
	rGHWn0/L5A2eCG1uhIMsov8rdIYG14527F8iCKk+FePs/xDhrbsf3nSaWD2OcKsjSBiS
	Q6f4llIIXGpo8Fz3X1aDMYbEcDBdZ7rxamjFnfnVpbPSfY5O1bamH99OIUw1pMQB2v0p
	FPNKBPBFmDv5tiFiOxv0IL8E69rguRdivnUDwM3zsA+fkY4lI5Urv1OXksNa2dJsw+nH
	HRPy0aOGuz6pDEpU4kBfQKuLXb86XHrp3TiG+Cdk2E9w+KEs6F/+amSiqD7XLtWTAOkk
	4lwA==
X-Received: by 10.52.165.76 with SMTP id yw12mr35413447vdb.91.1441165381686;
	Tue, 01 Sep 2015 20:43:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.201.130 with HTTP; Tue, 1 Sep 2015 20:42:42 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 2 Sep 2015 15:42:42 +1200
Message-ID: <CADySD0E_yJCeRTS-chGrT0-SUqUfU8TpHTMWmzGmCfMjTS=UHg@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: Using 1GB Nand with AM335x
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
X-List-Received-Date: Wed, 02 Sep 2015 03:43:09 -0000
Content-Type: multipart/alternative; boundary=001a11c2c2aea35c3c051ebb763b

--001a11c2c2aea35c3c051ebb763b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I have following queries regarding usage of 1GB Nand (MT29F8G16ABACAWP)
with AM335x

- what is the meaning of cells in "reg" property of gpmc nand child node ?
Information here is not clear
http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/mtd/=
gpmc-nand.txt?v=3D3.14

- what should be the value of property "gpmc,device-width" if
"nand-bus-width=3D <16>" ? I think it should be "2"


Please confirm whether below is correct for 1GB 16-bit bus-width nand

&gpmc {
	status =3D "okay";
	pinctrl-names =3D "default", "sleep";
	pinctrl-0 =3D <&nandflash_pins_default>;
	pinctrl-1 =3D <&nandflash_pins_sleep>;
	ranges =3D <0 0 0x08000000 0x40000000>;	/* CS0: NAND */
	nand@0,0 {
		reg =3D <0 0 0>; /* CS0, offset 0 */
		ti,nand-ecc-opt =3D "bch16";
		ti,elm-id =3D <&elm>;
		nand-bus-width =3D <16>;
		gpmc,device-width =3D <2>;
		#address-cells =3D <1>;
		#size-cells =3D <1>;
		partition@0 {
			label =3D "NAND.SPL";
			reg =3D <0x00000000 0x000040000>;
		};
		partition@1 {
			label =3D "NAND.SPL.backup1";
			reg =3D <0x00040000 0x00040000>;
		};
		partition@2 {
			label =3D "NAND.SPL.backup2";
			reg =3D <0x00080000 0x00040000>;
		};
		partition@3 {
			label =3D "NAND.SPL.backup3";
			reg =3D <0x000c0000 0x00040000>;
		};
		partition@4 {
			label =3D "NAND.u-boot-spl-os";
			reg =3D <0x00100000 0x00080000>;
		};
		partition@5 {
			label =3D "NAND.u-boot";
			reg =3D <0x00180000 0x00200000>;
		};
		partition@6 {
			label =3D "NAND.u-boot-env";
			reg =3D <0x00380000 0x00040000>;
		};
		partition@7 {
			label =3D "NAND.u-boot-env.backup1";
			reg =3D <0x003c0000 0x00040000>;
		};
		partition@8 {
			label =3D "NAND.kernel";
			reg =3D <0x00400000 0x00600000>;
		};
		partition@9 {
			label =3D "NAND.file-system";
			reg =3D <0x00A00000 0x1F600000>;
		};
	}
}


Please also confirm the following arguments for UBIFS :

mkfs.ubifs -r </path/rootfs> -o </path/rootfs.ubifs> -F =E2=80=93m 4096 =E2=
=80=93e
253952 =E2=80=93c 1918
ubinize -o </path/rootfs.ubi> -m 4096 -p 256KiB -s 1024 -O 4096 ubinize.cfg
ubiformat /dev/mtd9 -f rootfs.ubi -s 1024 -O 4096


Thanks

Ankur

--001a11c2c2aea35c3c051ebb763b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:rgb(51,51,153)"><p>Hi,<br></p><p>I have followi=
ng queries regarding usage of 1GB Nand (MT29F8G16ABACAWP) with AM335x<br></=
p><p>- what is the meaning of cells in &quot;reg&quot; property of gpmc nan=
d child node ? Information here=C2=A0is not clear=C2=A0<a href=3D"http://lx=
r.free-electrons.com/source/Documentation/devicetree/bindings/mtd/gpmc-nand=
.txt?v=3D3.14">http://lxr.free-electrons.com/source/Documentation/devicetre=
e/bindings/mtd/gpmc-nand.txt?v=3D3.14</a> <br></p><p>- what should be the v=
alue of property &quot;gpmc,device-width&quot; if &quot;nand-bus-width=3D &=
lt;16&gt;&quot; ? I think it should be &quot;2&quot;<br></p><p><br></p><p>P=
lease confirm whether below is correct for 1GB 16-bit bus-width nand<br></p=
><pre class=3D"">&amp;gpmc {
	status =3D &quot;okay&quot;;
	pinctrl-names =3D &quot;default&quot;, &quot;sleep&quot;;
	pinctrl-0 =3D &lt;&amp;nandflash_pins_default&gt;;
	pinctrl-1 =3D &lt;&amp;nandflash_pins_sleep&gt;;
	ranges =3D &lt;0 0 0x08000000 0x40000000&gt;;	/* CS0: NAND */
	nand@0,0 {
		reg =3D &lt;0 0 0&gt;; /* CS0, offset 0 */
		ti,nand-ecc-opt =3D &quot;bch16&quot;;
		ti,elm-id =3D &lt;&amp;elm&gt;;
		nand-bus-width =3D &lt;16&gt;;
		gpmc,device-width =3D &lt;2&gt;;
		#address-cells =3D &lt;1&gt;;
		#size-cells =3D &lt;1&gt;;
		partition@0 {
			label =3D &quot;NAND.SPL&quot;;
			reg =3D &lt;0x00000000 0x000040000&gt;;
		};
		partition@1 {
			label =3D &quot;NAND.SPL.backup1&quot;;
			reg =3D &lt;0x00040000 0x00040000&gt;;
		};
		partition@2 {
			label =3D &quot;NAND.SPL.backup2&quot;;
			reg =3D &lt;0x00080000 0x00040000&gt;;
		};
		partition@3 {
			label =3D &quot;NAND.SPL.backup3&quot;;
			reg =3D &lt;0x000c0000 0x00040000&gt;;
		};
		partition@4 {
			label =3D &quot;NAND.u-boot-spl-os&quot;;
			reg =3D &lt;0x00100000 0x00080000&gt;;
		};
		partition@5 {
			label =3D &quot;NAND.u-boot&quot;;
			reg =3D &lt;0x00180000 0x00200000&gt;;
		};
		partition@6 {
			label =3D &quot;NAND.u-boot-env&quot;;
			reg =3D &lt;0x00380000 0x00040000&gt;;
		};
		partition@7 {
			label =3D &quot;NAND.u-boot-env.backup1&quot;;
			reg =3D &lt;0x003c0000 0x00040000&gt;;
		};
		partition@8 {
			label =3D &quot;NAND.kernel&quot;;
			reg =3D &lt;0x00400000 0x00600000&gt;;
		};
		partition@9 {
			label =3D &quot;NAND.file-system&quot;;
			reg =3D &lt;0x00A00000 0x1F600000&gt;;
		};
	}
}</pre><p><br></p><p>Please also confirm the following arguments for UBIFS =
:<br></p><pre class=3D"">mkfs.ubifs -r &lt;/path/rootfs&gt; -o &lt;/path/ro=
otfs.ubifs&gt; -F =E2=80=93m 4096 =E2=80=93e 253952 =E2=80=93c 1918
ubinize -o &lt;/path/rootfs.ubi&gt; -m 4096 -p 256KiB -s 1024 -O 4096 ubini=
ze.cfg
ubiformat /dev/mtd9 -f rootfs.ubi -s 1024 -O 4096</pre><p><br></p><p>Thanks=
<br></p><p>Ankur<br></p><p><br></p><p></p></div>
</div>

--001a11c2c2aea35c3c051ebb763b--
