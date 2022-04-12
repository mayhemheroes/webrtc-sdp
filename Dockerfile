FROM fuzzers/cargo-fuzz:0.10.0

COPY src/ /webrtc-sdp/src/
COPY fuzz/ /webrtc-sdp/fuzz/
COPY Cargo.toml /webrtc-sdp/Cargo.toml

RUN cd webrtc-sdp/ && \
    cd fuzz && \ 
    cargo fuzz build


# Set to fuzz!
ENTRYPOINT []
CMD ["/webrtc-sdp/fuzz/target/x86_64-unknown-linux-gnu/release/fuzz_target_parse_sdp"]