Subject: Re: Build core-image-weston for beaglebone/am335x with GPU SGX530 enabled
To: meta-ti@lists.yoctoproject.org
From: "Luca" <magnabosco.luca@gmail.com>
X-Originating-Location: Arzignano, Veneto, IT (185.23.87.190)
X-Originating-Platform: Windows Chrome 81
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 18 May 2020 12:19:19 -0700
References: <f734db2d-fd0b-cab1-9d37-54c3c3b49b70@ti.com>
In-Reply-To: <f734db2d-fd0b-cab1-9d37-54c3c3b49b70@ti.com>
Message-ID: <16879.1589829559511127279@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="rSI1q5ui2Vcq7GtgcvSw"

--rSI1q5ui2Vcq7GtgcvSw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

thanks a lot for the clarifications and updated info.
It seems I was relaying on outaded and/or incomplete info.

>=20
> libgbm is a virtual as it has multiple optional providers, one of which
> is ti-sgx-ddk-um, our standalone libgbm has been deprecated, use the one
> provided by ti-sgx-ddk-um:

>=20
> PREFERRED_PROVIDER_virtual/libgbm =3D "ti-sgx-ddk-um"
>=20

Perfect, thanks. I was just starting to understand that the standalone lib=
gbm has been deprecated reading http://software-dl.ti.com/processor-sdk-lin=
ux/esd/docs/latest/linux/Foundational_Components/Graphics/Migration_From_Pr=
ior_Releases.html#from-processor-sdk-6-1-to-6-2-for-am3-4-5-6

>=20
> EGL provides window system (x11, wayland, gbm, surfaceless) integration
> for both GL and GLES (and OpenVG), but our EGL implementation only
> supports GLES, as that is all our GPUs support (at least on AM335x).
> Full desktop GL would have to be done using SW rendering, which is
> probably not what you want.

I understood that full GL would have been done using SW rendering, but I t=
hought it was the only way to get Weston working.

>=20
> So my question back is then, why are you trying to pull in 'mesa' and/or
> 'mesa-gl'? Weston works fine with the stack we provide in ti-sgx-ddk-um.
>=20

Your question is very legitimate.
I was pulling mesa-gl just to fulfil Weston dependencies, but thank to you=
r info I now understand that I was doing it the wrong way.
Then the question is:
How should I set the providers to get Weston working fine with ti-sgx-ddk-=
um?

Regards
Luca

--rSI1q5ui2Vcq7GtgcvSw
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,<br /><br />thanks a lot for the clarifications and updated info.=
<br />It seems I was relaying on outaded and/or incomplete info.<br /><br /=
>
<blockquote><span style=3D"white-space: pre-wrap;">libgbm is a virtual as =
it has multiple optional providers, one of which<br /></span><span style=3D=
"white-space: pre-wrap;">is ti-sgx-ddk-um, our standalone libgbm has been d=
eprecated, use the one<br /></span><span style=3D"white-space: pre-wrap;"><=
/span><span style=3D"white-space: pre-wrap;">provided by ti-sgx-ddk-um:</sp=
an></blockquote>
<blockquote><span style=3D"white-space: pre-wrap;"></span><span style=3D"w=
hite-space: pre-wrap;"></span><span style=3D"white-space: pre-wrap;"></span=
><span style=3D"white-space: pre-wrap;">PREFERRED_PROVIDER_virtual/libgbm =
=3D "ti-sgx-ddk-um"<br /></span></blockquote>
Perfect, thanks. I was just starting to understand that the standalone lib=
gbm has been deprecated reading&nbsp;<a href=3D"http://software-dl.ti.com/p=
rocessor-sdk-linux/esd/docs/latest/linux/Foundational_Components/Graphics/M=
igration_From_Prior_Releases.html#from-processor-sdk-6-1-to-6-2-for-am3-4-5=
-6" target=3D"_blank" rel=3D"noopener">http://software-dl.ti.com/processor-=
sdk-linux/esd/docs/latest/linux/Foundational_Components/Graphics/Migration_=
From_Prior_Releases.html#from-processor-sdk-6-1-to-6-2-for-am3-4-5-6</a><br=
 /><br />
<blockquote><span style=3D"white-space: pre-wrap;">EGL provides window sys=
tem (x11, wayland, gbm, surfaceless) integration<br /></span><span style=3D=
"white-space: pre-wrap;">for both GL and GLES (and OpenVG), but our EGL imp=
lementation only<br /></span><span style=3D"white-space: pre-wrap;">support=
s GLES, as that is all our GPUs support (at least on AM335x).<br /></span><=
span style=3D"white-space: pre-wrap;">Full desktop GL would have to be done=
 using SW rendering, which is<br /></span><span style=3D"white-space: pre-w=
rap;">probably not what you want.</span></blockquote>
I understood that full GL would have been done using SW rendering, but I t=
hought it was the only way to get Weston working.<br /><br />
<blockquote><span style=3D"white-space: pre-wrap;">So my question back is =
then, why are you trying to pull in 'mesa' and/or</span><br style=3D"white-=
space: pre-wrap;" /><span style=3D"white-space: pre-wrap;">'mesa-gl'? Westo=
n works fine with the stack we provide in ti-sgx-ddk-um.<br /></span></bloc=
kquote>
Your question is very legitimate.<br />I was pulling mesa-gl just to fulfi=
l Weston dependencies, but thank to your info I now understand that I was d=
oing it the wrong way.<br />Then the question is:<br />How should I set the=
 providers to get Weston working fine with&nbsp;<span style=3D"white-space:=
 pre-wrap;">ti-sgx-ddk-um?<br /></span><br />Regards<br />Luca<br /><br /><=
br /><span style=3D"white-space: pre-wrap;"><br /></span>

--rSI1q5ui2Vcq7GtgcvSw--
