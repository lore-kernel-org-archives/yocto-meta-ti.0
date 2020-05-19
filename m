Subject: Re: Build core-image-weston for beaglebone/am335x with GPU SGX530 enabled
To: meta-ti@lists.yoctoproject.org
From: "Luca" <magnabosco.luca@gmail.com>
X-Originating-Location: Isola Vicentina, Veneto, IT (109.234.143.106)
X-Originating-Platform: Windows Chrome 81
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 19 May 2020 01:04:56 -0700
References: <20200518193055.GE26065@beryl>
In-Reply-To: <20200518193055.GE26065@beryl>
Message-ID: <1100.1589875496492221729@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0eL8EBD0vsP9Gf4x1bKH"

--0eL8EBD0vsP9Gf4x1bKH
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

thanks a lot for the clarifications.

>=20
> Weston does not require mesa or mesa-gl.

Sure, I will try to reformulate what I meant:

Weston requires opengl "REQUIRED_DISTRO_FEATURES =3D "opengl"" and I thoug=
ht that this meant that libgl was required,
therefore I tried to use mesa-gl that provides virtual/libgl.

Now I know I was wrong, but what is providing opengl if libgl is not avail=
able?
Probably I don't get the proper meaning of "REQUIRED_DISTRO_FEATURES =3D "=
opengl"".

>=20
> E.g. Arago Project distro in meta-arago, used by TI Processor SDKs does:
>=20

Ok, I will keep meta-arago ( http://arago-project.org/git/?p=3Dmeta-arago.=
git;a=3Dsummary ) as reference for my distro layer when using meta-ti as bs=
p layer.

Regards
Luca

--0eL8EBD0vsP9Gf4x1bKH
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Denys,<br /><br />thanks a lot for the clarifications.<br /><br />
<blockquote><span style=3D"white-space: pre-wrap;">Weston does not require=
 mesa or mesa-gl.</span></blockquote>
Sure, I will try to reformulate what I meant:<br /><br />Weston requires o=
pengl "REQUIRED_DISTRO_FEATURES =3D "opengl"" and I thought that this meant=
 that libgl was required,<br />therefore I tried to use mesa-gl that provid=
es virtual/libgl.<br /><br />Now I know I was wrong, but what is providing =
opengl if libgl is not available?<br />Probably I don't get the proper mean=
ing of "REQUIRED_DISTRO_FEATURES =3D "opengl"".<br /><br />
<blockquote><span style=3D"white-space: pre-wrap;">E.g. Arago Project dist=
ro in meta-arago, used by TI Processor SDKs does:<br /></span></blockquote>
Ok, I will keep <a href=3D"http://arago-project.org/git/?p=3Dmeta-arago.gi=
t;a=3Dsummary" target=3D"_blank" rel=3D"noopener">meta-arago</a> as referen=
ce for my distro layer when using meta-ti as bsp layer.<br /><br />Regards<=
br />Luca

--0eL8EBD0vsP9Gf4x1bKH--
